# Criando componentes para o Maker Studio Bootstrap

> Fonte: https://manual.softwell.com.br/docs/dicas-e-truques/componente/criar_componentes_Maker3

# Criando componentes para o Maker Studio Bootstrap

Este documento tem como objetivo demonstrar, em todos os seus detalhes, o processo de criação de novos componentes para as versões do Maker Studio Bootstrap.

Para que haja fluidez no aprendizado e evitar dúvidas fora do escopo deste documento, são necessários alguns pré-requisitos:

- Conhecimentos em lógica de programação avançada;
- Conhecimentos em Maker Studio Bootstrap avançado;
- Conhecimentos em XML intermediário.

- Os componentes que forem criados e adicionados a paleta de componentes da ferramenta poderão ser utilizados em outras aplicações desenvolvidas com o Maker, além disso os templates de fluxos também poderão ser utilizados para otimizar regras criadas e que possam ser reaproveitadas em outros sistemas.

# Criando a estrutura de um componente.

![criar_compo_maker3_17.png](/assets/images/criar_compo_maker3_17-5de1514f7c2d3b97cd1f0b97d97fd41b.png)

A estrutura é definida com um documento XML que será interpretado pelo Maker. Para começar, por padrão, definimos primeiro o documento XML com a tag:

`<?xml version=“1.0” enconding=“ISO-8859-1”?>`

Seguida da tag:

`<component>`

Essa tag define o início e o fim da estrutura do nosso componente e possui alguns atributos necessários para o devido reconhecimento pelo Maker. São eles:

- **category** (esse atributo define em que categoria nosso novo componente será incluído, pode ser uma categoria existente ou uma nova);

![criar_compo_maker3_1.png](data:image/png;base64,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)

- **class** (define o nome que referenciará o componente para o Webrun);
- **image** (define o caminho da imagem que será mostrada para o componente, quando inserido em um formulário. Formato admitido pelo Maker é o .bmp, resolução 32x32 ou 50x50 pixels);

![criar_compo_maker3_2.png](/assets/images/criar_compo_maker3_2-2e546ed24961ea48575f97f925a1f27c.png)

- **icon** (define o caminho da imagem que será mostrada na lista de componentes, como ícone do componente. Formato admitido pelo Maker é o .bmp, resolução 32x32 ou 50x50 pixels e a imagem deve ter como cor de fundo a cor ‘magenta’).

![criar_compo_maker3_4.png](data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACYAAAAmCAYAAACoPemuAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAAhdEVYdENyZWF0aW9uIFRpbWUAMjAyMTowOTowOCAxMzo1MzowM+Ermi8AAACGSURBVFhH7dhBCoAgEIXhMaQj6aZO38pTFUhBS1/NyJTvg3D7O9qiQozzLg6FlBaXYdO5usMwFMNQDEMxDMUwVHNYKVt9ejGd2JvNqIRZTHOcy681vf9NzOJe3Y1zx7Q0f4xcx5bzWldrcNhT6Ia+f5S98a1EMQzFMBTDUAxDuQ1z+nNY5ADeNyZPVv8RzgAAAABJRU5ErkJggg==)
![criar_compo_maker3_3.png](data:image/png;base64,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)

Seguindo a estrutura hierárquica presente nos documentos XML’s, dentro das tags `<component>` temos a tag `<property>` como filha.

Essa tag define as propriedades que serão descritas no menu do componente e que possivelmente servirão de parâmetros para os fluxos que darão utilidade ao componente.

![criar_compo_maker3_5.png](/assets/images/criar_compo_maker3_5-81e7b9937b9a9dca9b7c80ad543259ec.png)

O Maker já traz algumas propriedades implementadas, que estarão presentes mesmo se não forem colocados no documento XML, são eles:

```prism-code
    <property description=“Dica” realname=“dica” dialogtype=“btDialog” type=“text” />  
  
    <property description=“Posição X” realname=“PosicaoX” dialogtype=“btUpDown”/>  
  
    <property description=“Posição Y” realname=“PosicaoY” dialogtype=“btUpDown”/>  
  
    <property description=“Altura” realname=“Altura” dialogtype= “btUpDown”/>  
  
    <property description=“Tamanho” realname=“Tamanho” dialogtype= “btUpDown”/>  
  
    <property description=“Visivel” realname=“Visivel” dialogtype=“btDialog” type=“boolean” default=“true”/>  
  
    <property description=“Nome” realname=“Nome”/>  
  
    <property description=“Código” realname=“Codigo”/>
```

A tag `<property>` possui diversos atributos. São eles:

- description (define o que será mostrado, como nome da propriedade, para o desenvolvedor);
- realname (recebe o nome real da propriedade, será usada para referenciar a propriedade como parâmetro em fluxos);
- dialogtype (define o tipo de interação que será disponibilizado ao desenvolvedor logo após o nome do atributo);

São três os tipos de diálogos:

- **btDialog** ![criar_compo_maker3_6.png](data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAJsAAAAYCAYAAADtRY/6AAABE0lEQVRoBe2aAQrDIAwA/f8r/Jsf8AeOOCylQxyLs425gqyU1iaX0+FmiDEWDgisIBCQbQVm3iEEqmwiHA0G/3TgkI1xB4EegZRS0bYQQu3++BptF3ov5bpPAiKa5pDZsrmFbBqSDp5tsuWcyy8N2RxIMitFZJtFkn6GBJBtiIgbZhFAtlkk6WdIANmGiLhhFoGrbLKylCaLhd75eSHBAmFWJRz0g2wOivyUFK+ynWetb86Z2Z5SSQNxIJuBIu0SIrLtUkkDeSCbgSLtEiKy7VJJA3kgm4Ei7RIisu1SSQN5iGzy84WmfWwxMpA3Id5AoP1LoP2U0NkWrhy1mhHv6dkq2w2DhVc6JfDeHO40edJeS+AFYRtyAJyNFhwAAAAASUVORK5CYII=)
- **btDropDown** ![criar_compo_maker3_7.png](data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAJcAAAAzCAYAAACaEpqBAAADxUlEQVR4Ae2cQW6rMBCGfS4OxBmqnMJHyDInYJlTVOoCqZuomyqLKKvu5sk2g8eOIQmJH8L+KyEMGJv5+TweYBpF+IMCEwqcTid6ZVET7WI3FLBgvSID4HpFvcLPNV7L/F0ul0UL4CockFfMA1yvqIdzZxX4D3B11CpFbTd7HThYoALvg6vX1ChFihfQVCAuz5mUgmvkgzkR6zg2czGXBash3fvOe60JzsrrUWMpBZcBKAVYDJatZ0UzcDWaBFtCSzMtMnhDufNezjq4rh07hMMT0m28OAVXDFgKLA8X9aQbRSoJWAyXqMdQMVF2u4XH2zhUfPlzcDFgU2AJuFxzvW6cBwogi+FiL2bOkcdS23yZWG9RgXtwzYF1AxcL4CBjDyQBkmVT+942t4j1FhXIAhcN06Sb7SRAsgy4tgjMM9f8Hri6lhr5qBh4JAmULAOuZ27UFuu+By4O6MU7C47Rw6kPcG0RkqXX/Ca4lnaP80pWAHCVfHdXts3Atd/vFy9qt9sRFmiQgwGk3KzsHUruHnCVfHdXtg1wrXwDSu4ecJV8d1e2bSFc5n2X/4Dd6amMipWtQ/erKiDgCoEJryp6edq1LjN1yIoI3+6HZ2KrXgVu4VIq+hRkxIngqlcvWP6EAhFcJp3GeTD/+ScBF+dxDZ+LwrpEXSvSpYP0nSeuDFU3r0ACLuOoTGYpp9zEcPWkWxFjRXVtuo4AyoIW07d52WDAIwqk4SKiEJK5aVEek2Xu3uyToPJ+rEtXYBIuzulywXoIzZixOmZRcHZqCqTw3NIFhX1egRm4TCUGg9fDlCmmPV9H1vcduOPwXFKRWsp34OL4ywTog3cyMZaAy3kx9lxDMC+OI+aqBaVbO+/DZfkScEWJhY3W4l/PXAd4WrwVusY9Aq4azYfNORUAXDnVrbxtpT6+CAs0yMJAlkYBLAasYQBwwWtlYyBbw/Be8F6PwfVjf1ykO2CUP6YXdLI6BWLpc/gzSp8/GH3wwMsZGOGyYP2R1n7UNccztRB3ubi1axfA9XumJimImRYZvKF88F7OTpeH6/hWB9OnH6CjvkldC6/njf8m/UtEScBiuEQ9hoqnULt9hcerEabYZg+XG0XN8c95oACyGC72YuYceSy1XfjojAXFtg8jYrh420HGHkgCJMspmOLjgIs1rW49bbCbJl38JIGRZcA1rR8GlX9Df7hSf/z2Li2Y7iRQsgy4ANfMIPLiDAH9+MxH5J/6JFCyDLi8fjMi1xqHQRxAkY2BbA3XOlphtw+tcvzoF9rEj8kZBv4BYQyxdPeNgM0AAAAASUVORK5CYII=)
- **btUpDown** ![criar_compo_maker3_8.png](data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAJsAAAAYCAYAAADtRY/6AAABn0lEQVRoBe2a8c2DIBDFmYuBnMcRnMItnMA/XcAN7sujnh8lgo1USXOPhAAWPO/x84C2TpiowAMKTNMkbhgGYaYGdzIAlgNsD0BNEz+qwLIsUpudc8H7j2DTzj+qFx+7QgGAVpMQLZUfwlajpIGxCtu6rnIlEzYDkHzLRcL2LSV5n1MFzmDDElmKeIxspxKzgypQgg2gac4Bl4Vt7v0+2LlOxs2ibvD0AVjaUSAHm0IWl0fAZWAbpesUL5EA3tYmbHbgSj3NwXYE1tG1DGyJmbkX73uZRfaja9KDTQMKPAPb2IljZDOAU9nFHGzx8qn1a5ENUY17tvIsGPk0BxvAUshQHoGGa8VlNOzVtuVT9cTNmGwqUIJNgcuBVoQNoPkeu7T3RNje9bDUOoOtBFoeNiyd0Wk0FpSwxWrYqt8DGw4E0Zd0r7oXBDrCZguw2Nt7YIstJHXClghiqEnYDE12a1cBG06UNVmD1Ud/MWrtMO23U+C1nfr/DfRqGx4E2Gqo5di6t96Kfjts7d4bWrakAJdRS7Pd2FfC1ngCLJkHbH8BGTrumwwbggAAAABJRU5ErkJggg==)

- **type** (define o tipo da propriedade);

Os valores possíveis para type são:

- **url** (geralmente definida quando deseja-se abrir um formulário. Deve ser usado com as propriedades **formguid**, **title**, **width**, **height**);
- **boolean** (define que a propriedade assume valores de verdadeiro ou falso);
- **list** (define que a propriedade é uma lista de valores. Deve ser usado com a tag `<list>`);
- **image** (abre a tela de seleção de imagens da galeria de imagens do Maker);
- **text** (abre um editor de texto);
- **sql** (abre o assistente SQL);
- **color** (mostra uma lista de cores para seleção. Só pode ser usado com `btDropDown`. Cores passadas como default ou como Value tem que ter o `‘cl<nome da cor em inglês>’`);
- **field** (define que a propriedade é um campo de uma consulta sql. Deve ser utilizada com o atributo source);
- **integer** (define o atributo como um valor inteiro);
- **letras** (define o atributo como tipo letras);
- **font** (abre um formatador de fontes).

Obs.: Para todos os valores do atributo **type**, deve-se escolher o **dialogtype** que melhor adapte-se a necessidade da propriedade. Ex.: Para um **type** definido como `list`, recomenda-se utilizar o **dialogtype**=`“btDropDown”`.

- **formguid** (recebe o identificador único/GUID de um formulário);
- **default** (define um valor padrão para a propriedade);
- **title** (define o título que aparecerá na janela do formulário que será aberto);
- **width** (define a largura do formulário que será aberto);
- **height** (define altura do formulário que será aberto);
- **source** (recebe o valor do **realname** de uma propriedade que tem o **type** definido como `sql`).

A tag `<property>` também possui uma tag filha, é a tag `<list>`, que é utilizada quando a propriedade é definida como **list**. Ela é responsável por definir quais itens serão mostrados na lista. A tag `<list>` possui uma tag filha que trata os itens da lista, é a tag `<item>`.

A tag `<item>` possui dois atributos:

- **name** (recebe o nome descritivo do item da lista);
- **value** (recebe o valor atribuído ao item da lista).

A tag `<event>`, irmã da tag `<property>`, representa todos os eventos que serão aceitos por esse componente. Possui dois atributos, são eles:

![criar_compo_maker3_9.png](data:image/png;base64,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)

- **description** (define o que será mostrado, como nome do evento, para o desenvolvedor);
- **realname** (recebe o nome real do evento).

Obs.: Por questões de implementação, no caso da tag `<event>`, o nome que é utilizado para referenciar o evento para um fluxo é o próprio nome que é passado como **description**.

A tag `<function>` também é uma tag filha da tag `<componente>`, irmã das tags `<property>` e `<event>`. Ela representa fluxos que são exclusivos dos componentes criados. Ex.: Fluxos que são adaptados ao funcionamento do componente e só servem a ele e a mais nenhum propósito.

A tag `<function>` possui alguns atributos, são eles:

- **name** (recebe o nome da função);
- **category** (define em que categoria a função deve ser inserida);
- **layer** (representa a camada a qual a função pertence).

Valores aceitos pelo atributo layer são:

- 1 para cliente;
- 2 para servidor;
- 1,2 para cliente e servidor.

A tag `<function>` possui duas tags filhas, são elas:

- `<description>` (que recebe uma tag `<![CDATA[documentação da função]]>`, onde é passada a descrição ou a documentação das funções utilizadas);
- `<params>` (essa tag representa a série de parâmetros utilizados pela função com o auxílio da tag `<input>`, que representa o parâmetro em si. A tag `<input>` recebe alguns atributos:

  - **name** (nome do parâmetro passado);
  - **type** (tipo do parâmetro passado);
  - **size** (tamanho do parâmetro passado - opcional).

Após construir toda a estrutura do componente no documento XML, devemos testa-lo para saber se a integridade das tags foi obedecida. Para tal tarefa, tentaremos abrir o XML no browser, se retornar uma mensagem de erro, volte e analise o XML do início ao fim. Depois salve-o no diretório a seguir:

**C:\Program Files (x86)\Softwell Solutions\Maker Studio Bootstrap\Resources\PT\Components**

Dentro da pasta **Components** criaremos uma pasta com o nome do componente criado, onde será salvo o nosso XML e, dentro da pasta do componente, criaremos a pasta **Images** para guardar as imagens dos ícones (**.bmp**).

A partir desse ponto o nosso componente já pode ser usado no Maker, basta que fechamos e abramos novamente o sistema. Porém ele ainda não é útil.

# Tornando o componente útil

Agora entramos na parte mais complexa da criação do nosso componente (a regra de negócio). De início precisamos entender o que fazer com o XML que criamos e como trabalhar com todas as nossas propriedades, eventos e funções.

Precisamos entender o que é o **mapa de atributos** que o Webrun cria e como utiliza-lo.

## Iniciando o componente

Primeiro, precisamos inicializar o nosso componente. Para isso, criaremos um fluxo padrão, que precisa começar com o nome `“<Valor do Atributo class> - Iniciar Componente - Cliente”`.

![criar_compo_maker3_10.png](/assets/images/criar_compo_maker3_10-f37701d39ae0030a8cfc733d251dd5ff.png)

Esse fluxo será responsável por receber o **mapa de atributos** passado como parâmetro, do tipo **variante**, pelo Webrun.

![criar_compo_maker3_11.png](/assets/images/criar_compo_maker3_11-dcf25cc3c908029c3cd625f7f096137e.png)

## Mapa de Atributos

Quando arrastamos um novo componente para o nosso formulário, o Maker interpreta o XML e gera um menu de propriedades e um menu de eventos, como citado acima quanto falávamos do documento XML. No caso do Webrun, é criado um **mapa de atributos**, que nada mais é, do que uma lista de identificadores (chaves) e atributos (valores).

Para acessar os valores do **mapa de atributos** utilizaremos a função “Obter Elemento”, na categoria Mapeamento. No primeiro parâmetro passamos o **mapa de atributos** e no segundo, passamos o **realname** da propriedade desejada ou **description** do evento desejado, o retorno será o valor da propriedade ou mapa do evento definidos para o componente.

![criar_compo_maker3_12.png](/assets/images/criar_compo_maker3_12-8d6e8857a1b80fd0826ef03c981d03fe.png)

**Obs.: Leia sempre a documentação das funções.**

## Tratando os eventos

Se o componente criado tiver eventos definidos no XML, será preciso trata-los e atribuir os possíveis fluxos que forem associados aos respectivos eventos. Para isso utilizaremos uma lógica simples:

**Primeiro**: Verificamos se o evento tem fluxos associados a ele. Para isso utilizaremos a função **“Obter Elemento”** para obter o mapa do evento.

![criar_compo_maker3_13.png](/assets/images/criar_compo_maker3_13-a2ae03336a948cdc4b1eb1295f625a69.png)

**Obs.: Leia sempre a documentação das funções.**

Logo depois verificaremos se o mapa do evento é vazio ou nulo com a função **“É Nulo ou Vazio”**.

![criar_compo_maker3_14.png](/assets/images/criar_compo_maker3_14-d8456fce2ef77f83393d303524b625d5.png)

**Obs.: Leia sempre a documentação das funções.**

Em caso de resposta ser SIM ligaremos a decisão com o FIM, se a resposta for NÃO, devemos associar o fluxo ao componente, mas antes precisamos saber o nome do fluxo que está associado ao evento;

**Segundo**: Utilizaremos novamente a função **“Obter Elemento”** para obter o nome do fluxo associado ao evento. No primeiro parâmetro passaremos uma variável que represente o mapa do evento, obtido anteriormente. No segundo parâmetro passaremos o valor Nome (letras), que representa a chave para o nome do fluxo associado ao evento. O retorno deve ser atribuído a uma variável que represente o nome do fluxo;

![criar_compo_maker3_15.png](/assets/images/criar_compo_maker3_15-ee5381f92d4fe35a2373ca70626a012b.png)

**Obs.: Leia sempre a documentação das funções.**

**Terceiro**: Agora vamos atribuir o fluxo ao evento do componente. Para isso utilizaremos a função **“Associar Evento ao Componente”**. No primeiro parâmetro passaremos o ID do componente obtido do **mapa de atributos** (para obter o id do componente deve-se passar no segundo parâmetro da função **“Obter Elemento”** como Nome). No segundo parâmetro passaremos o nome do evento no padrão W3C (Dom Events). No terceiro parâmetro passaremos a variável que representa o nome do fluxo, obtida anteriormente.

![criar_compo_maker3_16.png](/assets/images/criar_compo_maker3_16-06abe1d70078b91310581b7b88b2bcf7.png)

**Obs.: Leia sempre a documentação das funções.**

A partir desse momento, tudo o que for feito é dependente da lógica necessária para o correto funcionamento do componente, como, por exemplo, uso de fluxos para tratar as regras para os eventos, criação de funções especificas (através de código) para a criação do componente.

Obs.: Os nomes dos fluxos acima e de todos os outros que pertençam ao componente, têm que conter a devida formatação `<Valor do atributo class> - <nome do fluxo>`.

# Componente na prática

A seguir veremos um exemplo detalhado da criação de um componente realizado pela Softwell Solutions S/A em um de seus Webinar’s mensais.

Acesse: <https://www.youtube.com/watch?v=SLkij8wiCus>

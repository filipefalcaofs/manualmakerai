# Filtrando componente por outro que não possui vinculo com o banco

> Fonte: https://manual.softwell.com.br/docs/maker-mobile/como_fazer/filtrando_componente_por_outro_que_nao_possui_vinculo_com_o_banco

# Filtrando componente por outro que não possui vinculo com o banco

Crie um novo formulário com o nome **Cadastro de Cidades**, o formulário não possui fonte de dados.

![](/assets/images/filtrando_componente_por_outro-5591123d932bb2b865ee5b8e7b959d43.jpg)

![](/assets/images/filtrando_componente_2-2949775237e6c2ebaf3ad5d283ffabdb.jpg)

Adicione um componente **Lista** e na propriedade Lista, informe os seguintes valores e para a propriedade nome determine "Estado".

![](/assets/images/filtrando_componente_3-cc120d0909457195cf1d0a0893cb0367.jpg)

Em seguida adicione um componente **Lista Dupla**, o sql do componente deverá ficar da seguinte maneira.

![](/assets/images/filtrando_componente_4-e9dca380475b1d082ec4d08b5df8a393.jpg)

Observe o critério **COMPONENTE\_Estado**, através dele o componente será filtrado.  
Para a propriedade Campo Chave determine **cid\_id** e para a propriedade Campo Lista determinde **cid\_nome**.  
Como resultado final o formulário ficará da seguinte forma.

![](/assets/images/filtrando_componente_5-5a9589f61df263ac534acc43303b3eb8.jpg)

Salve o formulário, exporte a aplicação para a plataforma desejada e execute-a.

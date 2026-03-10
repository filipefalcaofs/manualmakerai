# Executor de Scripts SQL

> Fonte: https://manual.softwell.com.br/docs/maker/executor_scripts_sql

# Executor de Scripts SQL

No Executor de Scripts SQL, é possível executar qualquer comando (inserção, atualização, recuperação e remoção de registro) no banco de dados que foi apontado nas Configurações do Sistema. Ademais, pode ser selecionada uma outra conexão que tenha sido configurada. Este recurso está acessível por meio do menu Utilitários, selecionando o Executor de Scripts SQL.

A tela apresenta as opções:

1. Selecione a Conexão no campo ![image465.gif](data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAMIAAAASCAYAAAAJ3wEeAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsIAAA7CARUoSoAAAAKSSURBVGhD7ZfPjilREMarrYSICTYWQggL8Xos/HkCS4/haYhIh1ixJNEbERJ9letzy3G6zRhtxu3zS75U1VfV5/Sc1mGs3W7nbrdbMhjCRjQapfV6Td1ulyLmJTCEFf7sp1Ip2u/3ZDmO4559gyF0xGIxqtfrZB2/GsyLYAgt8Xj89CJEXNclqY+Pj6tcSs4FKbnfs/d9dL3vXvfsv8PoOQLWarW6VOl0mo71TQ503rPBHhyZoPcLmntnavhZEokENRqN628ERpdDy+Xyxnu2sAfHV+wXtOQ5ytzodwh86UWQymQyF0lP9uBLT/p+uTrr5+v6ckbWuogcgid95LIn+2oPnjxHmRsFK/ksVMk5YM1ms0tVKpXoWN/kKmoPNUdGXcNvXp1VubeGxGtG+tJjdD48RvW9+iq6ea9ZQzDweauo55/NZqnZbFLkcDgQxOhyVWoPNTOdTrU+3xTEsM+z8OR1ullESK11HmpE1fO6V3gszMBHhGR9775lbhS8+NlJ5POGwEM/jdQeakSdP5lMriRnGNTlcvlqDj1ESK11HmpEL8/Ph+Ajqv5n7lvmRq8RngVHXR986RuhUqloe6gR7/lYh6Nt2yc9urafhxrRy/Pz1ftChFAj+vkyN3qd+POl81l4GazxeHx5LarVKh3rc/W3lnj14Ouulz2gm/eaZfzWkPhdp+bSY9QZoLtOoq4hwby6huH3kM/nqdVqkTUajS4vQq1Wo2N9rt6PV9z/d/Z49/P9HykUCtRut69/Gg2Hw9PDkt47idH5z9Sje/C58vnqekY/J2ANBoN//zEYDCGjWCxSp9Mha7lcuvP5/GwbDOEhl8vRZrOhXq9H1mKxcJPJ5LllMIQHx3Go3++Tbdv0Bwzvz1t0/bmGAAAAAElFTkSuQmCC) (sempre demonstra (Conexão principal) como padrão). Caso existam Conexões Adicionais no projeto, este campo disponibilizará a utilização.
2. Ao clicar no botão Exibir lista de objetos do banco de dados ![image466.gif](data:image/gif;base64,R0lGODdhDgAOAPcAAAAAhAAAvQAA/xAQhEpKSlJSUmtra3Nzc3t7e4SEhISl/4yMjIyl94yt/5SUlJSt95St/5ycnJyt95y175y195y1/6WlpaW196W1/6W996W9/62tra29/63G/7XG/729vdbW1t7e3ufe1ufn3ufn5+/v7/f39////wAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAACwAAAAADgAOAAAIhgAjCBhIsODACAESKly4cACAhxAjPhywQQEEDR4+nNjI8cQGCxYxdLDQkaOFCBYrdIhgoqVLExEcpOTg4KVLBwtmLijBs2eJBQkUNKiQIYHPngkQCKWQAQGJp1BJIDiwNMOBqFAPGBAq4YKBEGDDhjBQQAGDBxMOgFjLFkQBEQTiyp0bd0RAADs=), o formulário é redesenhado e são habilitadas as abas Tabelas, Visões e Procedimentos com os respectivos elementos de cada objeto. Clicando com o botão direito do mouse sobre qualquer dos elementos das abas, aparece um menu pop-up que possibilita a execução de um procedimento, SELECT, Insert, Update, Delete, Extrair DDL ou EXECUTE. Os resultados de todas as ações citadas podem ser vistos em tempo real na área ao lado direito da tela.
3. O usuário pode editar a consulta ao seu modo (utilizando o painel de edição ao lado).
4. Podem-se ![image467.gif](data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAEQAAAAWCAYAAAB5VTpOAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsIAAA7CARUoSoAAAACjSURBVFhH7ZfhCoUgDIWtt/UVfABfuxhs3d2DPyKaLjgfDG3ZDz/XwK3WehRysetIFAoBKASgEIBCgClCWms6+zHKIXfWvE3qCum962we4ULklGVjK077CUsrRCRZGP7Zj35NJKFCZBNW9qMqkZyFf2ffeEa5CFL3kBVM6SEWXyBMiAjwv4RFdjFpmqrIygCv/wCbKkAhAIUAFAJQCEAhf5RyAikJPn0Aj/2+AAAAAElFTkSuQmCC) arquivos contendo comandos SQL e pode-se ![image468.gif](data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAEQAAAAYCAYAAABDX1s+AAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsIAAA7CARUoSoAAAAC6SURBVFhH7ddhCoUgEARgiy7rFTyA1y4WVGqw2GxbCuYDCcv9sfO0eFOMcQ3UzOVKBQMBDAQwEMBAgHkgKaU2NLTrvJgGIs3lnNv4WrMarx4ZCeVvXN8h9Sj1dg7e2897dTi3spSrCTwmuEP2c1mn3UFnddr6O0wDEVdNX/2isq6uv1Nnze3I1Cbr0BqtG2X+lXlCGsbd4c3tHYLPtEbrRvHvP3D97P4BAwEMBDAQwEAAAwEMBDCQgxA2k6lc8+ctlhMAAAAASUVORK5CYII=) a consulta em um arquivo com extensão \*.sql sugerido pelo Maker.
5. Utilize o botão ![image469.gif](data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAEoAAAAZCAYAAACWyrgoAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsIAAA7CARUoSoAAAADWSURBVFhH7ZgLCsMgEERt6WW9ggfItVMWHLqInwlqAmUeiJvtxtqXKNJXjPEMYsg792KARJFIFIlEkUgUiUSRTB8PUko5+nEcR47+hyWinhBz9/dq6ZFsFeWXZRmjeWr5Wg0oYzRQXs/wyf0UfjKj5WC1vgbXrXwP/3nr3tEYLEtEtSZjeZs0YoBcj6s/kBlzhkf2KJPg2yx4g1aNV2P7HoXJt574lXyr9g6W71FG76mW0lDL5Gux9T6/C/0fRaJzFIlEkUgUiUSRSBSJRJFIFIlEUYTwBVwgerFYPTFnAAAAAElFTkSuQmCC) para rodar a instrução SQL construída e visualize o resultado na aba Dados (parte inferior da tela).
6. Pode-se utilizar o ![image470.gif](data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAGoAAAAZCAYAAADZl7v4AAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsIAAA7CARUoSoAAAAE+SURBVGhD7ZkNCoMwDIXdbusVPIDX3njgg/DWVl1aaSAflHb50aTPIsPXuq6fJZme9zEnk5NCBSGFCkIKFYQUKggpVBC6CbVt27G6jye3N6iFQ7E+9ZfiezLFidr3/Vj94tmAu7mIRy0cNl996h9NF6HYxJOFPwF6moXhJwriqYBq03UpntCvNs7WDjSuFBMBt1Bomk+enir6rL1kIzUffgPr1xhPLqGdYyaGnii7IVhzVhtp+Qg3kXGkFm+p5VpwHY5W3NN0e0fVNqDUcGsTzjaIm8hxB0+upVXfKFxCoWBtHoONcD6zkZavxJWYGqXcq9e7Wl9PXJ85UCyKVqydDdk4tV2JVz8o5QONb+UqrRjrA3pPpXaPf8jvUQ7sQzCaFCoIw/9HJX1IoYKQQgUhhQpCChWEFCoIKVQIluUL1GsLCDKBmUIAAAAASUVORK5CYII=) para auxiliar na construção da consulta.
7. Na parte inferior da tela, além da aba Dados demonstrando o resultado da consulta, temos as abas Log e Histórico. Estas abas irão historiar os resultados dos comandos SQL executados. Na aba Histórico, ao efetuar o duplo clique em um dos comandos SQL executados, o comando reaparece no painel de edição para ser executado e a data do registro é consultada somente no computador que executou a consulta.
8. Clique direito do mouse, no trecho selecionado do script, permite:

   1. Copiar - copia o trecho selecionado;
   2. Recortar - retira o trecho selecionado;
   3. Colar - cola o trecho que foi copiado ou recortado anteriormente;
   4. Selecionar - seleciona todo conteúdo do painel de edição;
   5. Desfazer - desfaz a última alteração realizada;
   6. Deletar - apaga o conteúdo selecionado;
   7. Localizar - localiza informação dentro do painel de edição. É necessário informar o conteúdo que deve ser localizado dentro do painel de edição;
   8. Substituir - substitui informação dentro do painel de edição. É necessário informar o conteúdo que deve ser substituído dentro do painel de edição.

Suporte e Melhorias do Assistente SQL

- Nova versão do Assistente de Relatório com suporte melhorado a instruções CASE complexas;
- Suporte a DISTINCT, e LIMIT no POSTGRESQL;
- Suporte a Extrair DDL das VIEWs no Firebird;
- Observe o caso abaixo:

SELECT CAMPO1, CAMPO2 FROM TABELA START WITH CAMPO1 IS NULL CONECT BY PRIOR CAMPO2 = CAMPO1

Por ser um comando específico do Banco de Dados Oracle, não há suporte no Maker. Para solucionar, é preciso:

- criar uma VIEW (visão) ;
- criar um Trigger (gatilho) vinculado à view criada. Exemplo:

Create VIEW nomeVIEW as

SELECT

ACO\_CODIGO,

ACO\_NOME

FROM FR\_ACAO

START WITH ACO\_CODIGO IS NULL CONNECT BY PRIOR ACO\_CODIGO = ACO\_CODIGO

Segue abaixo a descrição das extrações de DDL suportadas pelo Maker:

- View:
- - SQL Server
  - Oracle
  - FireBird
- Procedure:
- - SQL Server

Observação: O Maker ainda não oferece suporte para gerar DDL de entidades originárias de conexões adicionais e bancos do MySQL.

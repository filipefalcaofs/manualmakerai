# exemplo_de_grafico_no_formulario

> Fonte: https://manual.softwell.com.br/docs/dicas-e-truques/componente/exemplo_de_grafico_no_formulario

# exemplo\_de\_grafico\_no\_formulario

## Exemplo de Gráfico no Formulário

A dica a seguir exemplificará a utilização do componente Gráfico para exibição de dados. O formulário final terá o seguinte *layout*:

![image798.jpg](/assets/images/image798-d756702c0bbc348ca6edec255137e2e8.jpg)

Observe a modelagem das entidades envolvidas:

![image799.jpg](/assets/images/image799-53685ac8e11aed06c0f09c0d00cbe7f9.jpg)

Este formulário deve apresentar, em um gráfico do tipo circular de setores, os funcionários destinados ao projeto e detalhar os valores correspondentes ao salário de cada um envolvido.

1. Criar o formulário principal baseado na tabela sig\_projeto

![image800.jpg](/assets/images/image800-2c16c4c16f3c764ec1c25cafcfaa25e1.jpg)

2. Inserir um componente Gráfico no formulário e configurar

![image801.jpg](/assets/images/image801-67dc13743ec48e1aecc622c0ff908ea7.jpg)

Configure o componente da seguinte forma:

- Para a Propriedade Cor, selecione uma cor que vai preencher todo o espaço equivalente a área do gráfico;
- Para a Propriedade Título, determine o título principal para o gráfico. Por exemplo Despesa com pessoal;
- Para a Propriedade Legenda, confirme a exibição selecionando Sim;
- Para a Propriedade Posição da Legenda, defina Abaixo (como exemplo);
- Para a Propriedade Estilo da Legenda, defina Automático (como exemplo);
- Para a Propriedade Conteúdo da Legenda, defina Etiqueta e Valor (como exemplo);
- Para a Propriedade Cor da Legenda, defina Branco (como exemplo);
- Para a Propriedade Mostrar 3D, defina Sim (como exemplo);
- Para a Propriedade Séries, configure os seguintes itens:

  - Clique no botão ![image629.png](data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABkAAAAZCAYAAADE6YVjAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAABTSURBVEhLY8jPz/9PazxqCUl4xFnS+X/Xi/8IcHERFjW48aglWNTgxgNlCZqBxIIXu/53YpgFwcPaEmx4aEY8NjxqCQQTaQlleNQSkvBwsST/PwD7Shy5RC42gAAAAABJRU5ErkJggg==) (Adicionar) para adicionar uma Série para o gráfico:

![image802.jpg](/assets/images/image802-64ea74bc6a156b05d2d4b24dd9fd7c3f.jpg)

- No campo check da grade Séries, permaneça com este item ativo para que a série seja utilizada na constituição do gráfico;
- Na coluna Tipo da grade Séries, clique no local e selecione o Pizza;
- Na ultima coluna desta grade, clique no botão ![image633.jpg](data:image/jpeg;base64,/9j/4AAQSkZJRgABAQEAYABgAAD/4QCqRXhpZgAATU0AKgAAAAgACQEaAAUAAAABAAAAegEbAAUAAAABAAAAggEoAAMAAAABAAIAAAExAAIAAAAQAAAAigMBAAUAAAABAAAAmgMDAAEAAAABAAAAAFEQAAEAAAABAQAAAFERAAQAAAABAAAOw1ESAAQAAAABAAAOwwAAAAAAAXbyAAAD6AABdvIAAAPocGFpbnQubmV0IDQuMS42AAABhqAAALGP/9sAQwABAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEB/9sAQwEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEB/8AAEQgAEAAQAwEiAAIRAQMRAf/EAB8AAAEFAQEBAQEBAAAAAAAAAAABAgMEBQYHCAkKC//EALUQAAIBAwMCBAMFBQQEAAABfQECAwAEEQUSITFBBhNRYQcicRQygZGhCCNCscEVUtHwJDNicoIJChYXGBkaJSYnKCkqNDU2Nzg5OkNERUZHSElKU1RVVldYWVpjZGVmZ2hpanN0dXZ3eHl6g4SFhoeIiYqSk5SVlpeYmZqio6Slpqeoqaqys7S1tre4ubrCw8TFxsfIycrS09TV1tfY2drh4uPk5ebn6Onq8fLz9PX29/j5+v/EAB8BAAMBAQEBAQEBAQEAAAAAAAABAgMEBQYHCAkKC//EALURAAIBAgQEAwQHBQQEAAECdwABAgMRBAUhMQYSQVEHYXETIjKBCBRCkaGxwQkjM1LwFWJy0QoWJDThJfEXGBkaJicoKSo1Njc4OTpDREVGR0hJSlNUVVZXWFlaY2RlZmdoaWpzdHV2d3h5eoKDhIWGh4iJipKTlJWWl5iZmqKjpKWmp6ipqrKztLW2t7i5usLDxMXGx8jJytLT1NXW19jZ2uLj5OXm5+jp6vLz9PX29/j5+v/aAAwDAQACEQMRAD8A/oh0LQvhZ4W+FnwCVfgF8A/EF74g+Afws8T6xrHif4WeHdV1nUdZ1Xw7CNQvb3UBDby3c93Lb/arm5uvOu7i6muJ57iRpPlNd0L4WeKfhZ8fVb4BfAPw/e+H/gH8U/E+j6x4Y+Fnh3StZ07WdK8OzDT72y1Aw3EtpPaS3H2q2ubXybu3uobeeC4jaP5uk8CfEH4WXvwl+B0a/F/9l+C90v4H/BHRNY0z4ieP/DsXiDRNZ8H6ZBqGoaQbIXry6bFdy3H9keI7C6Ed3PFDcWE8Vs0e9jx38QfhZZfCX44xt8X/ANl+e91T4H/G7RNH0z4d+P8Aw7L4g1vWfGGmT6hp+kCyN6kupRWktv8A2R4csLUSXcEU1vYQRXLSb1AP/9k=) (Construtor) para configurar a série do gráfico:

  - Ative a opção Cor para cada, para que cada fatia do gráfico tenha uma identificação diferenciada;
  - Na aba Fonte de dados, clique no botão ![image810.jpg](data:image/jpeg;base64,/9j/4AAQSkZJRgABAQEAYABgAAD/4QCqRXhpZgAATU0AKgAAAAgACQEaAAUAAAABAAAAegEbAAUAAAABAAAAggEoAAMAAAABAAIAAAExAAIAAAAQAAAAigMBAAUAAAABAAAAmgMDAAEAAAABAAAAAFEQAAEAAAABAQAAAFERAAQAAAABAAAOw1ESAAQAAAABAAAOwwAAAAAAAXbyAAAD6AABdvIAAAPocGFpbnQubmV0IDQuMS42AAABhqAAALGP/9sAQwABAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEB/9sAQwEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEB/8AAEQgAIgCWAwEiAAIRAQMRAf/EAB8AAAEFAQEBAQEBAAAAAAAAAAABAgMEBQYHCAkKC//EALUQAAIBAwMCBAMFBQQEAAABfQECAwAEEQUSITFBBhNRYQcicRQygZGhCCNCscEVUtHwJDNicoIJChYXGBkaJSYnKCkqNDU2Nzg5OkNERUZHSElKU1RVVldYWVpjZGVmZ2hpanN0dXZ3eHl6g4SFhoeIiYqSk5SVlpeYmZqio6Slpqeoqaqys7S1tre4ubrCw8TFxsfIycrS09TV1tfY2drh4uPk5ebn6Onq8fLz9PX29/j5+v/EAB8BAAMBAQEBAQEBAQEAAAAAAAABAgMEBQYHCAkKC//EALURAAIBAgQEAwQHBQQEAAECdwABAgMRBAUhMQYSQVEHYXETIjKBCBRCkaGxwQkjM1LwFWJy0QoWJDThJfEXGBkaJicoKSo1Njc4OTpDREVGR0hJSlNUVVZXWFlaY2RlZmdoaWpzdHV2d3h5eoKDhIWGh4iJipKTlJWWl5iZmqKjpKWmp6ipqrKztLW2t7i5usLDxMXGx8jJytLT1NXW19jZ2uLj5OXm5+jp6vLz9PX29/j5+v/aAAwDAQACEQMRAD8A/r0+M/x2+FX7Pfhew8Z/F/xT/wAIj4a1PX7XwxY6l/YfiPX/AD9cvdO1TVbax+x+GNH1q/j82w0XU7j7TNax2afZvKkuEmmt45fmX/h53+w5/wBFv/8AMa/F7/5gK8E/4LOf8mveA/8Asvfhf/1XnxSr+Ziu2rXnCbilGyS3TvqvVAf1xf8ADzv9hz/ot/8A5jX4vf8AzAUf8PO/2HP+i3/+Y1+L3/zAV/Lv8JvhzpHjyTx3q/irxLqXhTwP8MPBMfjzxtqvh/w1a+MvFY0e+8c+CfhppVt4W8K6j4m8EaRrepTeMfiJ4XOoQ6t418MWtj4aTXtYtrzUtU03T/Dmt6X/AApy+8eeL/8AhHf2bLX4kfH+B/Df/CTyWGh/CXxDafEPw/Y22p/2HqcfjLwR4YvviBpumfZtSewurXU/DXjPxj4en0PxJ4VbUNa0nxXfa14O8O5/WqnaH3P/AOSA/p2/4ed/sOf9Fv8A/Ma/F7/5gKP+Hnf7Dn/Rb/8AzGvxe/8AmAr+VOL4afEefwpfePIfh/42m8D6XpulazqXjOLwprsnhTTtH13xLrPgvQ9VvvESWB0i003WfGPhzxD4T0q+uLyO11HxLoWs6FaSzappd7awGq/DT4j6FaxX2ufD/wAbaNZT+CdG+JcN3qvhTXdOtZvhx4j1ix8PeHvH8Vxd2EMUngnXdf1TTdD0bxUjnQtU1jUbHTbK/nvbu3hkPrVTtD7n/wDJAf1Wf8PO/wBhz/ot/wD5jX4vf/MBR/w87/Yc/wCi3/8AmNfi9/8AMBX83+kfsofEfXfgvqXxb0201IXvh/TfiN4t8Q+Bb7wzrttrsPw48B2H7LmrQ+ONGa3tr2XVNN1nQP2odD8bSz3un6JoWl/DjwrqvjVPEep2V9aWsfifij4afEfwPo/hPxD41+H/AI28IaB49006z4F1zxR4U13w/o/jTR1tdNvm1XwnqWrWFpZeI9NFlrOkXZvtHmvLUWuq6bcGXyr61eU+tVO0Puf/AMkB/VZ/w87/AGHP+i3/APmNfi9/8wFH/Dzv9hz/AKLf/wCY1+L3/wAwFfzN+P8A4TeBvh/4asLbUfiZqTfFyTwT8NPiLe+Cp/AEkPga98NfFbwp4V8d+G9L8JfEmw8Vatq+q+NrDwd468Oax4j0nxX8NfAXhSyk0vxxpmkeOtd1DR/CEPxA7b4ifs5+EPCMPxs8PeH/AIleJPEPxP8A2bftH/C49B1j4baZ4Z8BD+xvih4V+Cvib/hWfjyy+JnirxD4y+yfEXxpoJ0L/hKfhr8N/wC2/BS6v4i1D/hHddsbLwdqp9aqdofc/wD5ID+i7/h53+w5/wBFv/8AMa/F7/5gKP8Ah53+w5/0W/8A8xr8Xv8A5gK/ll+Mnw+/4VJ8Xvir8Kv7X/4SD/hWXxI8c/D7+3vsH9lf23/whnifVPDn9r/2X9t1L+zf7S/s37Z9g/tG/wDsfnfZ/tt15fnyeb0fWqnaH3P/AOSA/sg+GH7dn7Kvxl8c6H8Nvht8U/8AhJPGviP+0v7F0X/hCPiPo/2z+x9H1DXtR/4mOveENL0m3+z6Tpd9d/6XfQed5HkQebcywwyfXFfyO/8ABMT/AJPj+CH/AHUr/wBVD4/r+uKumjUlUi5SSupNaX7J9W+4BRRWB4ol1KHRLuXSZpbe+SWxMcsNrPeTeT/aFqLyOKC20fX5jLNZm4hjlGj362zSC5lh8qJ3TZuyb7Ab9FeOQa94l+06Ml1c+JLOW7udCtbSzn0SKeDVnfxbrcGvm+vW8H6U9p5fhWxh1S2iMGgXEOnYupYJZVnmbb8B+NbjxWkEMdhc3FtYaJpv9reJJdlrb3HiWS3tXvtMtbIQReb5XmSyz3EJSGF0EYt1triwubrNVItpa3lt17dm7b9fXa1w9IooorQD8jv+Czn/ACa94D/7L34X/wDVefFKv5mK/sg/bO/ZY/4a7+F+g/Db/hO/+Fe/2J4+0vxx/bX/AAjH/CWfav7N8PeKdB/sv+zv+Eh8NeT53/CS/a/tv26Xy/sXkfZJPtPnQfmX/wAOQf8Aq53/AMwt/wDjZrirUqk6jlGN1Za3itl5u4H4/wDwY8b+EPDMPxU8JePJfEmm+FPi/wDDe2+H2q+J/COiaZ4q8Q+E/wCyvih8NPizY6vp/hDWfEvgnTfFH2/UvhhZ+FruwufGvhf+zrHxFc+JIb3U59Ci8N656Rpfi39nK18IeOfgv/wkXxs0/wABeJfEnwq+IP8AwtL/AIV14F13xfqvi/4a6Z8ZND/sj/hTv/C1/DejeEPDep6N8Zvs32//AIXb471SHU/h9/bH2I2nxH/sD4Zfpx/w5B/6ud/8wt/+Nmj/AIcg/wDVzv8A5hb/APGzWX1er/J/5NH/ADA+IfiN+2npHxK+I+heNdQ0zxtpOgWvwl/bj0G48CrqVrrej+HfiP8Ata67+1Xq1pqHh1ptQ0qyvdNt7L4zfDDR/Gfil9I8P67qdr4KujF4f1CLRPD1re5uuftG/CHxND4m8LalqXxsj8PfFr4b6toHxH8Y32meGPEXiHQvF+pfFD4NfFCPxOvw/Txt4Z8KfFn4kXsHwN8L/Dz4o/HYeIvgZqnxwsZtA+Jfiz4V6R8RfBniW6+MH3h/w5B/6ud/8wt/+Nmj/hyD/wBXO/8AmFv/AMbNH1er/J/5NH/MD4z+J37XXwh8Y/DTXvhj4Y8L/EjQNG1/4b/8IRbXGvP4Y8Ran4c/4R34U/8ABPrTvCMU95p934btPF/9o+Pf2Lda8L+I9bj0rwV/Z/hDxrpfxG0zw1qGs6fd/CpuJ+NX7QHwd8XfAnWfhp8ONL1LQJde+LXw08f6P4Li+BPwf+H2j/DTwp4I8HfGPQD4GvvjN4K8U6h8Sv2i9S0tviToelaV8Qvi14c0nxLrFr4f1nxVqiafr/i3V7GX9Av+HIP/AFc7/wCYW/8Axs0f8OQf+rnf/MLf/jZo+r1f5P8AyaP+YH5jz/Gnwha/s9ap8Lbbxh8bPF39t+G9B0bRfhB8QDpmpfCH4K+L7Lxv4c8Z+J/i78L/ABDH4vuPO8SeKf7D8XaBa6FafB3wHqnh/wAMfGjxjoeofEnxh/Yup6h8TPWviB8dP2dvFfg79rTxd4cTxtbfG79pXUrzxDf6d4o8PL4e8NeGNH8a/Hb4YfGHxb8P9E8SaH4x+I8XxQ1Lwhr/AIG06PwNr+r+BP2c7W+8KXnxO1/xXqOteIpvhj8MtN+3v+HIP/Vzv/mFv/xs0f8ADkH/AKud/wDMLf8A42aPq9X+T/yaP+YH5a/tQeKPgV8SviP8TPi58MPGHxa1DX/if8WvGfjy78H+PPhJ4O8G6P4d0fxrrviDxNcW1t4w8PfHD4hXuualpF7f6fpcMMvg3RLXU7V7zVHvNNltYNKvfl2v3s/4cg/9XO/+YW//ABs0f8OQf+rnf/MLf/jZo+r1f5P/ACaP+YHwT/wTE/5Pj+CH/dSv/VQ+P6/rir8jv2Yf+CWP/DOHxy8EfGf/AIXr/wAJl/whv/CS/wDFN/8ACsP+Ed/tL/hIvCGv+FP+Qx/wsLXPsf2P+3Pt/wDyC7r7R9l+y/uPP+0Q/rjXXh4ShBqSs+ZvdPSyXRvsAVWvLWK+t5LWZrlIpdm5rO8vNPuBsdZB5d5YT213DlkAfyp08xC0Um6N3RrNFbgeJpoHxB1SKTwbqE1zYeFYtS1X7T4on1SDUPEOu+H2vGex0xiLieWK5uopXW5uJre3hNiIreS3VLaew1b1/TdNsdIsbbTdNto7Oxs4xFb28QO1FyWYlmLPJLI7NLNNKzzTzPJNNJJLI7tdoqYwUerb2u9WktkrJWX9O4BRRRVAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFAH//2Q==) para ativar o Assistente SQL e monte a consulta da série do gráfico:

```prism-code
Select  
    RTrim(sig_funcionario.fun_nome) As Nome,  
    sig_funcionario.fun_salario  
From  
    sig_trabalha_em Inner Join  
    sig_funcionario On sig_trabalha_em.fun_cod = sig_funcionario.fun_cod  
Where  
    sig_trabalha_em.pro_cod = :pro_cod
```

- Na aba Fonte de dados, informe para o Campo Etiqueta, ou seja, para os rótulos principais, rótulos que serão impressos ao lado de cada fatia do gráfico ou serão utilizados na legenda do gráfico;
- Na aba Fonte de dados, informe o Campo Valor, ou seja, os valores que serão impressos ao lado de cada fatia do gráfico ou serão utilizados na legenda do gráfico;
- Na aba Opções, defina o valor 20 no campo Distância da maior fatia para que esta esteja em evidência.

3. Clique em Ok para sair da tela Propriedades da Série;
4. Na aba Opções da tela Gráfico, defina selecione uma Cor de Fundo para área do gráfico.

Agora ajuste o tamanho da área do gráfico e salve o formulário.

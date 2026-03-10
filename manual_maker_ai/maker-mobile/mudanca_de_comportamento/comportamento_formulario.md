# Comportamento de formulário

> Fonte: https://manual.softwell.com.br/docs/maker-mobile/mudanca_de_comportamento/comportamento_formulario

# Comportamento de formulário

A visualização de um formulário é completamente diferente no **Maker Mobile.** Observe imagens abaixo:

- Visualização do formulário no **Webrun**:

![](/assets/images/comportamento_formulario_1-d6f0f2ade45f3b0f8c73787ccae05c81.jpg)

- Visualização do formulário no **Maker Mobile**:

![](/assets/images/comportamento_formulario_2-1785824c6826a28f3d19a558e4772fcc.png)

No **Maker Mobile**, o formulário apresenta características diferentes na forma de navegação (inclusão, alteração, exclusão e pesquisa) de registros. Ao selecionar um formulário através do menu, é possível observar que o mesmo é exibido com todos os registros retornados na consulta (serão exibidos apenas os campos marcados na aba ***Localizar*** durante o desenvolvimento\_)\_ e apenas um campo estará disponível para busca.

![](/assets/images/comportamento_formulario_4-4123ae148607f0f2bdaf27a430682cba.png)

Na imagem acima, o formulário foi aberto através do Menu do sistema. Observe como os registros são listados. Nesta tela, é possível adicionar novos registros clicando no botão "+".  
Os demais dados serão exibidos após a seleção do registro desejado para consulta. A partir daí, é possível realizar os passos para Excluir/Alterar o registro.

> **Atenção:**
>
> Existem palavras reservadas que não podem ser utilizadas como nome de formulário. São elas: *login, menu, date* e *datetime*.
>
> O tamanho e o posicionamento dos componentes no Maker Mobile utilizam valor percentual, dessa forma não é possível determinar um tamanho fixo, ele se ajusta de acordo com o tamanho da tela do dispositivo móvel. É possível configurar o redimensionamento na tela de compilação do sistema, utilize a opção “*Tipo de Redimensionamento”* disponível.

Alterando um registro do formulário

A partir desta tela, clique no botão **Editar** no canto superior a direita da tela para alterar o registro que foi selecionado e em seguida clique sobre o botão **Salvar** para gravar as alterações.

![](/assets/images/comportamento_formulario_6-9e02897a9004365570903a04cf35a608.png)

Excluindo um registro

O método de exclusão também possui um comportamento distinto, para a exclusão repita o mesmo passo anterior, selecione o botão **Excluir** que se localiza na parte inferior do formulário, em seguida será apresentada uma tela de confirmação da exclusão, confirme para excluir o registro.

![](/assets/images/comportamento_formulario_7-d1fdb6d38a1d8b9eeb7edb9f2ebb4263.png)

# Alternar a visualização de componentes no formulário

> Fonte: https://manual.softwell.com.br/docs/dicas-e-truques/componente/alternar_visualizacao_componentes_formulario

# Alternar a visualização de componentes no formulário

Objetivo

Aplicar a função Mostrar Componentes acionada por botões.

Metodologia

1. Crie ou modele um formulário para visualizar os componentes:

![image348.jpg](/assets/images/alter_form1-fbae92e1ea64d05a8404a20ae131f802.png)

2. Serão utilizados dois componentes [Grade](/docs/dicas-e-truques/utilizando_a_propriedade_grade_mestre) (posicionados um sobre o outro) e a visualização do conteúdo será controlada por fluxos, ao clicar no botão.
3. Ative o Editor de Fluxo de Ações.
4. Defina na tela Parâmetro de Entrada, para o campo Formulário Principal, o nome do formulário modelado para o exemplo.
5. Insira na área de trabalho do [Editor de Fluxos de Ações](/docs/maker/editor_de_fluxo_de_acoes), um componente Processamento e defina:

   1. Utilize a função Mostrar Componente, informando para o primeiro parâmetro o nome do componente grade (por exemplo, aponte para a segunda grade) e para o segundo parâmetro determine Falso para desabilitá-lo:

![image348.jpg](/assets/images/alter_form2-1756d4d30a6bc6bf3a822aed6d1e91c2.png)

6. Insira outro componente Processamento e defina:
   1. Utilize a função Mostrar Componente, informando para o primeiro parâmetro o nome do componente grade (por exemplo, aponte para a primeira grade) e para o segundo parâmetro, determine Verdadeiro para habilitá-lo:

![image348.jpg](/assets/images/alter_form3-8988e601182451a805af6b045a7eae56.png)

7. Salve esse fluxo com o nome Ativar grade 1, definindo o tipo Cliente.
8. Associe esse fluxo ao evento Ao clicar do primeiro botão (aqui identificado Visualizar Departamento).
9. Repita os passos para a ação do segundo botão, invertendo as referências.

# Utilizando a Funcao Remover Arquivo

> Fonte: https://manual.softwell.com.br/docs/dicas-e-truques/funcoes/Utilizando_a__Funcao_Remover_Arquivo

# Utilizando a Funcao Remover Arquivo

Esse exemplo demonstrará o uso da função Remover Arquivo.

1. Crie um formulário sem fonte de dados com o seguinte layout:

![](/assets/images/exe68-17424efd27c8ffce7c2eb4a4d7b32c3e.png)

2. Crie um fluxo. Para facilitar o entendimento o fluxo ficará da seguinte forma:

![img22149.JPG](/assets/images/exe69-a3a3271345aaf5c23097439fa1c85a4a.png)

3. Defina o seguinte parâmetro de entrada:

![](/assets/images/exe70-a5aa8f7e63d75974eab6bfe4d9a5bafb.png)

4. Adicione um objeto Processamento e no Montador de Expressões selecione a seguinte função: Cria Novo Arquivo:

![img22151.JPG](/assets/images/exe74-b317cee526083c26af8b21ce9f59fde9.png)

5. Adicione um novo objeto Processamento e no Montador de Expressões selecione a seguinte função: Definir Variável da Sessão.

![img22152.JPG](/assets/images/exe71-1ffb41f16e093a93dd474c754aa39101.png)

6. Salve o fluxo na camada Servidor, associe-o ao botão Criar arquivo do formulário e defina o seguinte parâmetro de entrada.

![](/assets/images/exe72-0421f1c9641c8310957c2f25553d11dd.png)

7. Crie um segundo fluxo. Para facilitar o entendimento o fluxo ficará da seguinte forma.

![img22154.JPG](/assets/images/exe73-6587b1998df4fa52d17db87777d3f05a.png)

8. Adicione um objeto Processamento e no Montador de Expressões selecione a função: Obter variável da sessão.

![img22155.JPG](/assets/images/exe75-7937086db3e69137844e08f8a3e2e1c7.png)

9. Adicione um novo Processamento e no Montador de Expressão selecione a função: Remover Arquivo:

![img22156.JPG](/assets/images/exe76-02be553bd9e3c1e38d503420d1353e20.png)

10. Adicione um objeto interação com a seguinte informação: Arquivo Removido com Sucesso!

![](/assets/images/exe77-e0660c74ef517188fdc6d86ea0486a1d.png)

11. Salve o fluxo e associe-o ao botão Remover Arquivo.
12. Salve o formulário e execute-o no webrun:

![](/assets/images/img22158-aeae32424ee4074f981b601c19059fc8.JPG)

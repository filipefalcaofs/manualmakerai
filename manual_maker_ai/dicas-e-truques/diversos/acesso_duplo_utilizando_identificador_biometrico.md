# Acesso duplo utilizando o Identificador Biométrico

> Fonte: https://manual.softwell.com.br/docs/dicas-e-truques/diversos/acesso_duplo_utilizando_identificador_biometrico

# Acesso duplo utilizando o Identificador Biométrico

Ao tentar utilizar o [Identificador Biométrico](/docs/maker/instalacoes/instalacao_servidor_biometrico) no mesmo browser para mais de um sistema que estejam abertos, é possível que apresente a mensagem abaixo:

Erro: Erro ao tentar iniciar dispositivo de leitura!

![](/assets/images/dis1-8e448c5221681afa5a0bdbcf7bb79b08.png),

pois a dll (biblioteca) do Identificador já está instanciada para um outro sistema da jvm (servidor tomcat).

Além disso, o sistema operacional não permite acesso duplo a uma dll. Para que funcione corretamente, é necessário reiniciar o browser antes de acessar novamente o applet do outro sistema.

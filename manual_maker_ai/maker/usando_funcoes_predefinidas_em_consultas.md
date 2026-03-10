# Usando Funções predefinidas em consultas

> Fonte: https://manual.softwell.com.br/docs/maker/usando_funcoes_predefinidas_em_consultas

# Usando Funções predefinidas em consultas

As Funções predefinidas são usadas em [Valor Padrão](/docs/maker/propriedade_do_formulario) e podem ser utilizadas nas colunas Expressão, Critério e Ou. Abaixo consta uma imagem que exemplifica a utilização de uma dessas funções:

![image1226.jpg](/assets/images/image299-a2744bfa32f4cd78b033b48be5677554.png)

Conforme configuração apresentada na primeira imagem, possivelmente será necessário o uso de funções nativas da linguagem SQL de conversão:

- A sintaxe da função é :FUNCAO\_`<chave>` - sempre iniciar a função com : (dois pontos), em seguida a palavra FUNCAO\_ (em letra maiúscula) e depois a chave (em letra minúscula);
- Utilização da função CAST para definição de tipo de dados da função.

Abaixo estão listadas as funções predefinidas que podem ser usadas na tela [Assistente SQL](/docs/maker/iniciando_com_o_assistente_sql):

- :FUNCAO\_data - retorna data atual (dado originário do computador no qual está sendo executado o Webrun).
- :FUNCAO\_datahora - retorna data e hora atual (dado originário do computador no qual está sendo executado o Webrun).
- :FUNCAO\_hora - retorna hora atual (dado originário do computador no qual está sendo executado o Webrun).
- :FUNCAO\_horasimples - difere da função hora por não apresentar os segundos.
- :FUNCAO\_dia - retorna o dia, de acordo com a data atual (dado originário do computador no qual está sendo executado o Webrun).
- :FUNCAO\_mes - retorna o mês, de acordo com a data atual (dado originário do computador no qual está sendo executado o Webrun).
- :FUNCAO\_ano - retorna o ano de acordo com a data atual (dado originário do computador no qual está sendo executado o Webrun).
- :FUNCAO\_guid - retorna a informação contida no campo Identificador da tela [Definições do Formulário](/docs/maker/propriedade_do_formulario).
- :FUNCAO\_login - retorna o nome do usuário da sessão atual.
- :FUNCAO\_usuario - retorna o código de cadastro do usuário na tabela FR\_USUARIO (sessão atual).
- :FUNCAO\_administrador - retorna o valor padrão S, caso o usuário da sessão atual seja Administrador-Geral do sistema; caso contrário, a função retorna o valor N. Para recordar como configurar o usuário como Administrador-Geral, consulte o tópico [Usuários do Sistema](/docs/maker/usuarios_do_sistema).
- :FUNCAO\_sistema - retorna as três letras que representam o sistema.
- :FUNCAO\_sistemanome - retorna o nome do sistema.
- :FUNCAO\_conexaoid - retorna o ID da conexão ao sistema, gerado pelo Webrun.
- :FUNCAO\_conexaoguid - retorna o GUID (identificador único) da conexão gerado pelo Webrun.
- :FUNCAO\_ip - retorna o IP da conexão (cliente ou proxy do cliente que fez a requisição)
- :FUNCAO\_host - retorna o Nome do Computador (HOST) ou o IP da conexão (cliente ou proxy do cliente que fez a requisição)
- :FUNCAO\_rand1 - retorna um número aleatório entre 0 e 9.
- :FUNCAO\_rand2 - retorna um número aleatório entre 0 e 99.
- :FUNCAO\_rand3 - retorna um número aleatório entre 0 e 999.
- :FUNCAO\_rand4 - retorna um número aleatório entre 0 e 9999.
- :FUNCAO\_rand5 - retorna um número aleatório entre 0 e 99999.
- :FUNCAO\_rand6 - retorna um número aleatório entre 0 e 999999.
- :FUNCAO\_fluxo\_`<nome\_do\_fluxo>` - retorna o valor de retorno de um fluxo servidor.

O fluxo de ação utilizado na última função citada deve possuir um valor de retorno (Parâmetro de Retorno configurado no componente [Fim](/docs/maker/parametro_de_retorno)). Além disso, abaixo constam algumas observações sobre a sintaxe correta para a utilização desta função no Assistente SQL:

- usar letras em minúsculo. Ex.: :FUNCAO\_fluxo\_pagamento;
- não podem existir espaços;
- não pode haver caracteres especiais;
- - não deve conter "\_"(underline) no nome do fluxo.
- :FUNCAO\_sessao\_nomedavariavel - retorna o valor atribuído à variável de sessão definida pelo usuário. Como exemplo: FUNCAO\_sessao\_departamento. No momento da criação do fluxo que define a variável de sessão (função Definir variável de sessão), o usuário deve atentar para a definição do escopo como do tipo não global (ou seja, declarar falso para o terceiro parâmetro da função).

Observações:

1. Não é possível utilizar a condição "IN" passando o valor de uma variável de sessão.
2. não deve conter "\_"(underline) e espaços em branco no nome da variável de sessão.
3. :FUNCAO\_formulario\_[guid\_do\_formulário]\_[nome\_do\_campo] ou :FUNCAO\_formulario\_ [código\_do\_formulário]\_[nome\_do\_campo] - se o formulário estiver aberto, a função retornará o valor do campo do registro corrente; se o formulário estiver fechado, a função retornará o valor do campo do primeiro registro. São exemplos de uso da função a expressão :FUNCAO\_formulario\_B3D98C9A5DDC4C67A5E52DE9BC045BED\_pes\_cod e a expressão :FUNCAO\_formulario\_45\_pes\_cod.

Observações:

1. O Guid usado em: :FUNCAO\_formulario\_B3D98C9A5DDC4C67A5E52DE9BC045BED\_pes\_cod e não pode conter os caracteres ", " e "-".
2. A sintaxe: CONSTANTE\_`<chave>` que era utilizada anteriormente continua funcionando, mantendo assim compatibilidade com configurações já feitas:

![image1227.jpg](/assets/images/image299-a2744bfa32f4cd78b033b48be5677554.png)

![executor de script sql](/assets/images/image300-b53ece01fce6c49a363847dff21f8822.png)

- As funções predefinidas deverão ser utilizadas somente nas definições do formulário.

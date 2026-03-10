# Removendo os formulários duplicados do sistema

> Fonte: https://manual.softwell.com.br/docs/dicas-e-truques/maker/removendo_os_formularios_duplicados_do_sistema

# Removendo os formulários duplicados do sistema

Quando as configurações do sistema apresentam inconsistências, você pode tentar resolver resetando-as. Isso se aplica nos seguintes casos:

- Formulários, relatórios ou fluxos externos não são encontrados;
- Opções do sistema, como Requer Autenticação Avaçado, não são salvas ou executadas;
- Eventos do sistemas não são gravados ou executados.

Identificando o problema

Esta solução somente se aplica quando o SQL abaixo retornar mais de 1 (um) registro:

SELECT FR\_FORMULARIO.FRM\_CODIGO

FROM FR\_FORMULARIOinner join FR\_FORMULARIO\_SISTEMA FRM\_SIS on (FRM\_SIS.FRM\_CODIGO = FR\_FORMULARIO.FRM\_CODIGO)

WHERE (FR\_FORMULARIO.FRM\_DESCRICAO = '$\_FORMULARIO\_DO\_SISTEMA') and (FRM\_SIS.SIS\_CODIGO = 'ALO')

Método rápido

O comando abaixo irá remover todos os formulários do sistema, eliminando as duplicações. Será necessário sair do Maker e entrar novamente após executar esse comando SQL. Para remover todos os formulários do sistema, observe que a sigla ALO deve ser substituída pela sigla do sistema:

DELETE FROM FR\_FORMULARIO

WHERE FRM\_CODIGO in(select FR\_FORMULARIO.FRM\_CODIGO FROM FR\_FORMULARIO

INNER JOIN FR\_FORMULARIO\_SISTEMA FRM\_SIS on (FRM\_SIS.FRM\_CODIGO = FR\_FORMULARIO.FRM\_CODIGO) WHERE (FR\_FORMULARIO.FRM\_DESCRICAO = '$\_FORMULARIO\_DO\_SISTEMA') and (FRM\_SIS.SIS\_CODIGO = 'ALO'))

Método mais seguro

Faça o seguinte SQL, onde ALO é o código do sistema:

SELECT FR\_FORMULARIO.FRM\_CODIGO

FROM FR\_FORMULARIO INNER JOIN FR\_FORMULARIO\_SISTEMA FRM\_SIS on (FRM\_SIS.FRM\_CODIGO = FR\_FORMULARIO.FRM\_CODIGO)

WHERE (FR\_FORMULARIO.FRM\_DESCRICAO = '$\_FORMULARIO\_DO\_SISTEMA') and (FRM\_SIS.SIS\_CODIGO = 'ALO')

Observe a listagem do comando acima e delete a partir do segundo formulário com o comando SQL abaixo, em que 123 é o código do formulário:

DELETE FROM FR\_FORMULARIO

WHERE FRM\_CODIGO = 123

Atenção: Sugerimos que executem ***backup*** do projeto, pois qualquer configuração previamente feita no sistema será apagada.

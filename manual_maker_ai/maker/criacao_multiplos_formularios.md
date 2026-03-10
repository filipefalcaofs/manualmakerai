# Criação de Múltiplos Formulários

> Fonte: https://manual.softwell.com.br/docs/maker/criacao_multiplos_formularios

# Criação de Múltiplos Formulários

Este recurso ativa o Assistente de Criação de Formulário o qual possibilita a criação de vários formulários a partir das tabelas do banco de dados no qual está inserido o projeto.

Para acessar esse recurso, ative o menu Utilitários e, dentro da opção Assistentes, clique em Criação de Múltiplos Formulários:

![image516.jpg](/assets/images/image217-3678facbb30ef408d7dcf299de3c86ce.png)

Observe os itens da tela e suas funções:

- No campo Exibir tabelas começando com - são listados os projetos contidos na base de dados na qual consta o projeto que está sendo editado, além da  opção "(Todas)". Ao selecionar:

  - um projeto aparece no componente que sucede todas as tabelas que tenham como prefixo no nome a sigla do projeto;
  - a opção "(Todas)", aparece no componente que sucede todas as tabelas do banco de dados.
  - Ao digitar um texto no campo, o assistente realizará uma busca incremental na lista de tabelas.
- Há um checkbox no lado esquerdo de cada tabela listada no componente que mostra todas as tabelas disponíveis no banco de dados no qual está inserido o projeto, marcando-o, então a tabela será considerada no processo de criação de formulários. Há ainda o botão ![marcar todas](data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAKcAAAAXCAIAAADhvsjOAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAEDSURBVGhD7ZlRDoJADERX42W5wh7Ac1udsmkWaMBo6NJ5H9KWUpIZiyTepmkqJBl3PZJM0PWM0PWM0PWM0PWMxHW91qrRzLLyK2SyRasuO9tiwl1/8/xgg2sT2nW7T0PvVjQeehyN9iXAaiK1cUsFp9nHGdXY6tkz/yxC77oIBwXlsxNRUtCJjk5gT4Gu2Wc5ylbQI2i+6EEak1F/10VToPkaIj0Cbf2PDTp6Ht78bncPSHTXIWKnICpAS9scaj7K6nCJYXxYrvwOf4r0uGlw4wd4m7NrBBxN7Slc+LUBe0Y5FVwSE/7TmpErP+HJFnQ9I3Q9I3Q9I3Q9I3Q9I3Q9H6W8ANWutaWxCmkdAAAAAElFTkSuQmCC), que marca todos os checkboxes, e o botão ![desmarcar todas](data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAKgAAAAWCAIAAADb6UDmAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAErSURBVGhD7ZlhDoIwDIWn8TbcgYNxAM5tk9c0zWCVESbV9vsh3bNt2KuAxsc0TfM8lyQYTz4mwcjBByUHH5QcfFBy8EHJwQfFxc+5ZVk4KmVdV448oc+QOHKSVOJzL8DLFU8egcpiJ+DcdPDruLvVk60+Z/9nvPjoFfkQyHUGBUv9rtaJqrBVhcBItjFaCa2cI/3H4XrwZJA2i2JRJKiWlb5VZKljQzHYtqoUBK0cnfx9vH+rJ3cAljAOAZQWqCJ4vYc04VQz+TTcun8LQ/E+eHJHEEVMbEEJKCFYatOV3Mtuc4o/bmE07gYPp3ihgFN4vcq4W9y/dgun8fKMFxdaVwZ0UXTaFl1YYfTs5UgrQ0HJXeT/8UHx/oxPBpGDD0oOPig5+KDk4ENSyhv42uu5d4lWuQAAAABJRU5ErkJggg==), que desmarca todos os checkboxes;
- O campo Prefixar o nome dos formulários com - campo utilizado para definição do prefixo que nomeará o formulário que será criado. Exemplo: se o nome da tabela for "FUNCIONARIO" e o prefixo definido for "Cadastro de ", então o nome do formulário será "Cadastro de Funcionario". Como lembrete, sempre que for criado o prefixo, o recomendado é que seja inserido um espaço após o último caracter (para evitar que o último caracter fique junto do nome da tabela). Utilize o botão ![dicionário de dados](data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAKoAAAAZCAIAAAAuSiIOAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAFcSURBVGhD7ZlrkoNACIRNKrfxZF4hB9iDebJQaZZixcGZTTlq4PsTpgeI0ppHeRvHcUiicpumicMkGPM83zlMQpL2hybtD03aH5q0PzRpf2h2t/+pYOnNYimUdAdb0tRkM5kSBJYqaEo+ih53/88veiK05OgvJb0E9bQlrU02oYbgEqbW0/XDf4/xUU+OuvBlV8CDX7sjd61MU5aODhEKRAS6BGlagYhAkC3BSS5hS2raQql/l/04zH5Ag9BD8WMb2BxRiNUmYLFlFZ3ssCipaSuK3jqKE/3y35yFTaAJAl5/Bvdq6cYFLSW4AhBAOZAL//GjIdIEAUufwb3esOTy7wOg/KYrZj+62o958cJwkokQzpH4p1ADmp/kCujx3S/naQenp6B3S7pG56ziNLG1TjKxuuU3AbatKFhSXAo6kM/745LP+6OT9ocm7Q9N2h+atD80aX9o0v7ADMMLI60PpPEWEzYAAAAASUVORK5CYII=) para ter acesso ao Dicionário de Dados.
- Em Menu, selecione entre as opções:

  - Não adicionar ao menu - cria apenas os formulários, sem associá-los aos menus do projeto;
  - Adicionar ao menu - para selecionar em que menu o(s) formulário(s) gerado(s) será(ão) inserido(s);
  - Criar novo item de menu - será criado um novo menu e adicionados nele itens que apontem para os formulários que serão criados.
- Clique no botão ![executar](data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAFIAAAAZCAIAAAAt0e5jAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAADDSURBVFhH7Zd9CoMwDMXd2GV7hR6g517mC6EYdaUfY/Dy+0OTZyp5tEF8pJQ2Pp56JyNsMxG2mSC1PfQByzlrtFNK0ejvGbW9yOq6N4OY7UnYya8DgFTQ3FUKXvzU7dQp4m5eeu/FOrg6k1JgjxB7BfEB033x1ZJ2Rm37DkSR/hBAQXpKi4Gb5d38YrbFm6FSM9hhoNIMlsw2uvS79FXxBYuYNtvC6YbU/lFwoxwCuZoyl/jfZiJsMxG2mQjbTFDa3rY3Yf12tfb/1g4AAAAASUVORK5CYII=) para iniciar o processo de execução da criação dos formulários ou clique no botão ![cancelar](data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAFAAAAAVCAIAAABe5v4lAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAADHSURBVFhH7ZdhCsMwCIXd2GVzhRwg566giMQ0rM5BiPn+1NpUfL4QyKuUApl48zMNR/DupBP806FVa+UIoLXGUQRYObag4HeYehK0+JUJ29KomaO1+fAzDrGaRkAbgZIylG4NYjOErSaxj3jBWoN0qQN5nWQoRmxef3XwR4eFSYtaDwUdd3k3wYK1P496HQ7FXW1C2KHla8j+FSXsDr/DOHvdHFnRJYfoNfYvyhDfVHtKutuSU/Bw8NqcZTn34d05gncnmWCAC8msdZ+bo3c9AAAAAElFTkSuQmCC) para ignorar a execução e fechar a tela.

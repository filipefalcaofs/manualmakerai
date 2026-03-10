# Utilizando o iReport com o Maker

> Fonte: https://manual.softwell.com.br/docs/dicas-e-truques/relat%C3%B3rio/utilizando_o_ireport

# Utilizando o iReport com o Maker

O iReport é uma ferramenta que provê suporte para a criação de relatórios nos formatos PDF (arquivo somente leitura), XLS (arquivo do aplicativo Microsoft Excel) e HTML (linguagem de marcação para o ambiente web), os quais são suportados pelo Webrun. Apesar da existência desse suporte, a Softwell Solutions não se responsabiliza por subsidiar o usuário em como utilizar a ferramenta, descreveremos apenas os recursos básicos para a criação de um relatório conforme a documentação abaixo.

Pré-Requisitos:

- Habilitar a opção: "Conversão dos relatórios para JASPER", para isso no Maker clique em: Projetos --> Configurações --> Outros marque o checkbox "Conversão dos relatórios para JASPER", e reinicie o Maker.
- Baixe e Instale a versão homologada pela Softwell Solutions do iReport versão 3.1.2, para isso efetue o download da ferramenta através do site do iReport ou pelo seguinte link: <http://www.mirrorservice.org/sites/download.sourceforge.net/pub/sourceforge/i/ir/ireport/iReport/iReport-nb-3.1.2/iReport-nb-3.1.2-windows-installer.exe> Após a conclusão do download, efetue a instalação do mesmo. Cabe ainda lembrar que, para a perfeita execução da ferramenta, é necessário previamente ter instalado no computador a Máquina Virtual Java (JDK 5.0) que pode ser obtido no site da Oracle <http://www.oracle.com/technetwork/java/javasebusiness/downloads/java-archive-downloads-javase5-419410.html>.

Configurando e Acessando o Banco de Dados pelo iReport:

Primeiramente é necessário adicionar o drive JDBC que será útil no momento de configuração do banco de dados, para isso abra a iReport e clique em: Banco de Dados --> Drivers --> Novo Driver JDBC e escolha o diretório onde encontra-se o driver, clicando em Adicionar.

![novo_driver_jdbc.jpg](/assets/images/novo_driver_jdbc-eaa1fd98fee1ae76d423370089a5d06a.jpg)

Normalmente o diretório do drive JDBC encontra-se em:

![url_drive.jpg](/assets/images/url_drive-1749949f6fabdc0ea57883ba898bdda3.png)

Uma vez adicionado o driver do postgres (ou outro banco de dados do seu interesse). Crie a conexão com o banco de dados, conforme a imagem abaixo.

![conexao_bd.jpg](/assets/images/conexao_bd-caa346d4eeba31ca502bc2683363cd8c.jpg)

Criando um Relatório Simples no iReport:

Para criar um relatório, clique em Arquivo --> New Empty report, na tela que será aberta, escolha o nome do relatório e o local onde o mesmo será salvo.

![novo_relatorio.jpg](/assets/images/novo_relatorio-3219ad995c9d7d69257aa9c4fe1e32bf.jpg)

Observe que uma página em branco foi aberta, esta página será nossa área de trabalho dos relatórios, verifique que a mesma contém:

- Paleta de Elementos --> utilizado para adicionar diversos elementos para a área de trabalho, sendo estes: Label, Gráfico, Linhas,Imagens, Sub-Relatórios etc.
- Report Inspector --> utlizado para adicionar parâmetros, estilos, váriaveis, campos do banco de dados etc.
- Área Central --> utilizado para montar o relatório em sí, inserindo títulos, cabeçalhos, colunas e rodapé, nesta área também é possivel visualizar o código xml gerado, e visualizar uma prévia do relatório através da aba Preview .

![area_trabalho.jpg](/assets/images/area_trabalho-34f06ab24fb9c664487557337ff09581.jpg)

Inserindo Fonte de Dados no Relatório

Para colocar tabelas e campos no relatório clique com o botão direito do mouse em: report name do Report Inspector e em seguida clique em: Edit Query será aberta uma tela na qual deverá ser informada a consulta desejada. Esta poderá ser feita de forma manualmente digitando no espaço sql correspondente, os comandos SQL desejados ou através do botão Query Designer.

![report_query.jpg](/assets/images/report_query-a89ff44fa8b57b62663bde97aa19c118.jpg)

Para inserir através do Query Designer clique em: Query Designer --> public. Após selecionar o schema público, será possível visualizar todas as tabelas do banco de dados. Agora iremos adicionar as tabelas que iremos usar em nosso relatório e seus respectivos campos, para isso efetue um duplo clique na tabela sig\_funcionario e sig\_departamento e marque no checkbox os campos a serão utilizados. Clique em Ok para finalizar.

![campo_designer.jpg](/assets/images/campo_designer-e8d7183f22eae5dbe316b0cdf138d1c4.jpg)

Após clicar em Ok, é possível visualizar na opção Fields do Report Inspector, os campos que serão utilizados para montar o relatório.

Montando o Relatório com Filtros

Agora estaremos montando o relatório com os campos selecionados anteriormente, a montagem, o posicionamento e a organização dos campos poderá ser feita de duas formas:

**Manualmente**

Clique em: Fields do Report Inspector e arraste o campo desejado até a banda Detail, coloque na banda Column Header o "label" referente ao campo posicionado. Para adicionar um label arraste-o da Paleta de elementos. Ajuste o posicionamento de cada campo e clique em Preview para visualizar uma prévia do relatório.

\*\*

Via Wizard

\*\*O Wizard é um assistente, que nos auxiliará a montarmos o relatório de uma forma simples, rápida e fácil, para isso clique em: Arquivo --> Report Wizard e siga os sete passos sugeridos, que por sinal são bastante simples e intuitivos, conforme a imagem abaixo:

![wizard.jpg](/assets/images/wizard-13b5c7e70a512c2a7f6bce4ee2871177.jpg)

Tanto manualmente como pelo wizard a nossa área de trabalho ficará assim:

![relatorio_ireport.jpg](/assets/images/relatorio_ireport-1670b55dc7b49c0e2371e2fbd30becd5.jpg)

Efetuando Filtro via Parâmetro

\*\*

No iReport

\*\*

Para filtrarmos um registro do relatório via parâmetro, basta clicar em: Parameters do Report Inspector e em seguida Adicionar Parâmetro, colocamos o nome do parâmetro de porDepartamento porém você pode colocar o nome que preferir. Ajuste as proriedades do mesmo conforme a imagem abaixo ou conforme a sua necessidade.

![porDepartamento.jpg](/assets/images/porDepartamento-0eb0155a4e582841e25e549c4b4a7cf6.jpg)

Agora clique com o botão direito do mouse no nome do relatório no Report Inspector e em seguida em Edit Query, no final do comando SQL já existente, adicione a seguinte comando: WHERE sig\_departamento."dep\_cod" = `$P{porDepartamento}` Este trecho é o responsável por filtrar pelo departamento desejado. Caso exista alguma dúvida, Observe na sexta imagem deste tutorial, a parte grafada do código sql já com esta implementação.

Para selecionar o departamento desejado no iReport, clique em Preview e digite o código desejado do mesmo, conforme a imagem abaixo:

![por_departamento.jpg](/assets/images/por_departamento-d4f659f52dd448f38d909174a16ba681.jpg)

\*\*

No Maker

\*\*

Agora selecionaremos o filtro no relatório via nome do departamento, para isso acesse o relatório e na aba Dados do relatório, clique em Código SQL, será aberta a tela conforme a imagem abaixo, observe a numeração da mesma e insira na coluna Critério a variável do respectivo campo, o parâmetro desejado e a definição dos dados.

![maker_params.jpg](/assets/images/irep-21a46602d3d94f2df2dacbdc74e51239.png)

Clique em Visualizar Impressão, verás a imagem abaixo:

![maker_params_dados.jpg](/assets/images/maker_params_dados-4af8df5bef4e88ce1e6c25a9973ebbb3.jpg)

### Integrando com o Maker e Publicando no WebRun

Para visualizar o relatório criado no WebRun crie um relatório vazio pelo Maker e adicione ao menu do sistema. Este relatório não precisa ter o mesmo nome do relatório criado pelo iReport. Perceba que ao criar um relatório no Maker ele é salvo na tabela FR\_RELATORIO. Executando um Select nesta tabela, teremos o seguinte resultado:

![fr_relatoriop.jpg](/assets/images/irep1-84128b7a2860e4eb7d6037f766fcbd03.png)

Para integrar o relatório com o webrun, é necessário efetuar mais dois procedimentos, um no maker e outro no iReport.

- No Maker --> Clique em: Utilitários--> Exportar Relatório para Jasper marque o relatório vazio criado anteriormente e clique em Exportar exporte-o para o seguinte endereço: ![endereco_exportar.jpg](data:image/png;base64,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)

  Observe que após a exportação no diretório acima mencionado o Maker encarregou-se de criar outros três diretório, ficando assim:

  ![diretorio_final.jpg](data:image/png;base64,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)

É a pasta "bridge" que servirá como ponte, efetuando a ligação entre o Maker com o iReport, dentro da mesma conterá os relatórios. Observe que a pasta TRE corresponde a sigla do sistema (treinamento) a pasta com o número 8 corresponde o campo "rel\_codigo" da tabela FR\_RELATORIO. Dentro desta pasta serão colocados dois arquivos:

- Relatório criado com o iReports (arquivo de extensão .jrxml)
- Arquivo de configuração chamado "report.data"
- No iReport --> basta salvar o relatório no diretório acima mencionado, para isso clique em Arquivo --> Salvar Como e selecionar o diretório com o mesmo código da tabela FR\_RELATORIO, ficando assim:

  ![salvar_ireport.jpg](/assets/images/salvar_ireport-2aa7cfb5a9840b0a7d60ad4f44fe14e4.png)

Altere o conteúdo do "report.data" colocando o nome do relatório feito no iReport, conforme a imagem abaixo:

![arquivo_dataReport.jpg](/assets/images/arquivo_dataReport-3323c9798f19629af1800f38f287d13e.jpg)

O parâmetro "source" da imagem acima deve ser ajustado de acordo com o caminho da sua aplicação.

Feito isso, bastará acessar a aplicação e gerar o relatório.

Observações importantes no Maker:

- Altere o arquivo, report.data com o nome do relatório feito pelo iReport, conforme os passos citados acima (ex: Relatório Exemplo - Lista de Funcionários.jrxml) parte alterada.
- Limpe o Cache da Aplicação

Acessando o Relatório no WebRun

Para acessar o Relatório feito no iReport, e visualizá-lo no WebRun, basta inserir o relatório no menu do Maker e acessá-lo normalmente.

Importante: lembre-se que todos os passos citados acima, deve ter sido feito corretamente para o perfeito funcionamento do relatório, e que o relatório adicionado no Maker, encontra-se vazio, pois neste caso estamos apontando para o relatório gerado no iReport.

![relatorio_webrun.jpg](/assets/images/relatorio_webrun-76821ff173de102b602fdce628dce741.jpg)

Veja o Relatório Final gerado

![relatorio_final2.jpg](/assets/images/relatorio_final2-8bd3dc4fe54255302f2ebe28b0b4eba5.jpg)

\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_

Informações complementares sobre o iReport, consulte os seguintes links:

<http://community.jaspersoft.com/project/ireport-designer>  
<http://pt.scribd.com/doc/14811322/Desenvolvendo-Relatorios-Profissionais-Com-iReport-Para-Netbeans-IDE#download>

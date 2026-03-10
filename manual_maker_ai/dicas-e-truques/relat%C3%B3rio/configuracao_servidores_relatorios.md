# Instalação do Servidor de Relatórios

> Fonte: https://manual.softwell.com.br/docs/dicas-e-truques/relat%C3%B3rio/configuracao_servidores_relatorios

# Instalação do Servidor de Relatórios

Este recurso é aplicado para usuários que necessitam gerar relatórios Maker e contêm servidores aplicados para gerenciar relatórios. Para o ambiente Linux, será necessário um servidor Windows.

Para instalação do Servidor de Relatórios, utilize o arquivo Servidor de Relatórios.exe ([📥 disponível aqui](https://s3.us-east-1.amazonaws.com/download.softwell.com.br/makerAI/reports/Servidor_de_Relatorios.exe)) e siga os passos do assistente de instalação.

![image1844.jpg](/assets/images/image64-be3e244aa9b059a94daf2de115e51880.png)

Após a instalação, será criado automaticamente um serviço denominado `Servidor de Relatórios (Softwell Solutions)` no Windows.

## Conhecendo os executáveis da pasta Reports

- ReportServer.exe - Executável responsável pelo gerenciamento das requisições e controle de geração dos relatórios, este executável “chama” várias instâncias do ReportEngine.exe.
- ReportEngine.exe - Executável responsável pela geração dos relatórios.

## Parâmetros de configuração

A partir desta versão, o arquivo **MakerReports.ini** deixou de existir, dando lugar ao arquivo **Reporting.conf**. Neste arquivo constam os seguintes parâmetros:

- **MinWorkers** - Quantidade mínima de ReportEngine.exe que serão alocados em memória RAM. Valor padrão: 2.
- **MaxWorkers** – Quantidade máxima de ReportEngine.exe que serão alocados em memória RAM. Toda vez que uma requisição vier ao ReportServer.exe e não houver ReportEngine.exe disponível, um novo processo será criado para atender à requisição. Valor padrão: 5.
- **IdleTimeOut** – Tempo máximo de inatividade de um ReportEngine.exe, sempre que houver mais ReportEngine.exe alocados em memória RAM do que o definido no parâmetro MinWorkers e estes atingirem o tempo de inatividade definido, o ReportServer.exe irá retirá-los da memória RAM. Valor Padrão: 300 (Unidade utilizada: segundos).
- **RecycleCount** - Quantidade máxima de relatórios que podem ser gerados em cada ReportEngine.exe, quando o número de relatórios chegar ao valor definido neste parâmetro, o processo do executável ReportEngine.exe será encerrado e um novo processo será criado. Este parâmetro tem a finalidade de evitar Locks no processo ou Lixos de Memória. Valor padrão: 100.
- **ResponseTimeout** - Tempo máximo para que o relatório seja gerado, caso atinja o tempo máximo definido, uma exceção é gerada. Valor padrão: 60. (Unidade utilizada: segundos).
- **ServiceName** – Nome real do serviço. Se este parâmetro não existir, o valor padrão é: SoftwellReportServer.
- **ServiceDisplayName** – Nome de exibição do serviço. Se este parâmetro não existir, o valor padrão é: Servidor de Relatórios (Softwell Solutions).
- **ServicePort** – Porta onde o serviço do ***ReportServer*** estará escutando. Se este parâmetro não existir, ***o valor padrão é: 9193.***
- **ServiceLogging** – Habilita ou desabilita o log do serviço. Valor padrão: 0 (desabilitado) ou 1 (habilitado).
- **ServiceNatCompatibility** – Esse parâmetro deve ser utilizado quando o sistema está atrás de NAT (Network Address Translation) e precisa ajustar a forma como identifica IP, host ou origem das requisições para garantir a geração correta de relatórios. Valor padrão: 0 (desabilitado) ou 1 (habilitado).

## Pasta Settings

Esta pasta contém um arquivo chamado Default.ini, este arquivo define um padrão para todos os relatórios gerados dos sistemas existentes. Caso seja necessário customizar os relatórios por cada sistema existente, é necessário criar um arquivo no padrão “sigla do sistema.ini” (Ex.: SGP.ini). No momento da geração do relatório, o Webrun buscará pelo arquivo .INI correspondente à sigla do sistema, caso não encontre, as configurações padrão do arquivo Default.ini são carregadas.

- **UseImagesAsResources** – Se uma imagem se repetir no relatório a ser gerado, o Gerador de Relatórios aproveitará a imagem gerada anteriormente e replicará nos demais locais utilizados. Valor padrão: True.
- **EmbedTrueTypeFonts** – Fonte padrão do relatório. Valor padrão: None.
- - Full: Todas as fontes do Servidor serão carregadas no arquivo gerado;
  - Subset: Somente as fontes utilizadas no relatório serão carregadas no arquivo gerado.
- **ImageOutputFormat** – Formato de saída das imagens utilizadas no relatório. Valor padrão: JPEG.
- **ImagePixelFormat** – Densidade de Pixels da imagem utilizada no relatório. Valor padrão: 24bits.
- **JPEGQuality** - Qualidade da imagem utilizada.
- - Observação: Este parâmetro é formado pela extensão utilizada no parâmetro ImageOutputFormat + Quality (Ex.: PNGQuality). Valor padrão: 100. (Unidade utilizada: Percentual)
- **ImageSourceDPI** – Pontos por polegada utilizado na composição da imagem. Quanto maior for o valor definido neste parâmetro, mais detalhada e definida será a imagem gerada. Valor padrão: 300. (DPI – dots per inch).
- **Monochrome** – Este parâmetro permite gerar imagens em preto e branco. Quando for “True” a(s)  imagem(ens) utilizada(s) será(ão) gerada(s) em preto e branco. Valor padrão: False.
- **CompressionLevel** – Nível de compressão utilizado para geração do relatório. Valor padrão: MaxCompress.
- - Os valores destacados em verde são os valores válidos para cada respectivo parâmetro.

Observações:

1. Para que funcione corretamente é necessário que nenhum arquivo seja excluído.
2. Suporte somente a Relatórios gerados no RB10.
3. O Suporte a HTTPS somente é possível em ambientes que utilizem o padrão OpenSSL.

# Configuração de Servidores de Relatórios

O objetivo deste item é possibilitar que sejam gerados relatórios a partir de servidores separados. Como exemplo, Servidor Linux.  
Para isso, é necessário configurar o Webrun para que ele possa se comunicar com o Servidor de Relatórios.

![image287.jpg](/assets/images/image287-ca128c0988de8d0a6bdde684eb5fad39.jpg)

1. Adicione dois parâmetros:

   1. Servidor = `<host>`:9193
   2. ServidorRetorno = 1

Observações:

1. A porta é definida no monento da instalação do Servidor de Relatórios, caso seja necessário alterar a porta, é necessário reinstalar o Servidor de Relatórios e definir a porta desejada no momento da instalação. Por padrão, a porta é 9193.;
2. Para o Servidor de Relatórios funcionar corretamente, verifique se o Firewall não está bloqueando a porta.
3. Atualmente, o servidor de relatórios trabalha apenas com o Report Builder 10.

# Atualização automática do Servidor de Relatórios

- **Update.exe** - Executável responsável por verificar se há atualizações disponíveis para o Servidor de Relatórios, caso haja, o processo de atualização é iniciado.

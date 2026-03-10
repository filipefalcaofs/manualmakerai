# Canais de Atualização

> Fonte: https://manual.softwell.com.br/docs/maker/estrutura_de_pastas_e_arquivos/canais_atualizacao

# Canais de Atualização

O atualizador automático é configurado para trabalhar com dois canais de atualização: **Releases** e **Beta**.

> *Beta*

- A *versão BETA* de um software ou produto é a versão em estágio ainda de desenvolvimento, mas que é considerada aceitável para ser lançada para o público sendo homologada em ambientes externos, mesmo que ainda possua bugs e problemas que precisarão ser reparados pelos desenvolvedores antes do lançamento definitivo do produto ao mercado na sua versão final.

##### Ciclo de Atualização:

- Após serem realizados os testes internos com validação da versão (novas implementações e correções realizadas), a versão será disponibilizada no canal de atualização.  
  Decorrido esse período de homologação em ambientes externos, caso *não exista status report de um bug crítico* e/ou nenhuma possível **inconsistência** devido as novas implementações, a versão beta, passará a ser uma versão RC *(Releases Candidate)*.
- **Release candidate** é uma versão de um software que está praticamente pronto para ser colocado no mercado. Também pode ser chamado apenas de **RC**. Um produto com essa característica possui potencial para ser o produto final, pronto para ser lançado a menos que um defeito ou um bug mais sério apareça. Essa versão pode ser a primeira de um novo produto, ou pode ser uma nova versão de um produto já existente no mercado.
  Na fase de release candidate, todas as funcionalidades estão especificadas, testadas e implementadas por meio de uma ou mais fases *BETA*, onde não ocorreram bugs sérios.

> *Releases*

- No canal **Releases**, as atualizações são liberadas com menos frequência e as
  versões disponíveis neste canal são mais estáveis. Quando esse processo ocorre a versão do produto está pronta e pode ser usada pelo consumidor final.

  ##### Ciclo de Atualização:

  - Após todas as realizações de testes, validação e homologação em ambientes externos a versão será disponibilizada no canal de atualização. E este ciclo se repetirá a cada transformação de uma versão RC em uma versão RTM *(Release to Manufaturing)*.

> *Patch de atualização*

- Um patch é uma versão do produto criado para atualizar ou corrigir um produto de forma a melhorar sua usabilidade ou performance. Quando patches corrigem bugs e vulnerabilidades de segurança, se dá o nome de bugfix.

  ##### Ciclo de atualização:

  - Nesse modelo de atualização um ou vários clientes receberão um link de download contento a nova versão. Essa versão **sempre será superior** às versões disponibilizadas nos canais de atualização contendo apenas *implementações pontuais* em uma determinada versão do produto.

### Escolhendo o canal de atualização

Para definir o canal de atualização, siga os passos:

1. Com o projeto aberto, vá em Configurações (F6);
2. Navegue até a aba "Outros";
3. Na seção geral, observe "Canal de Atualização".

![canaisatt.jpg](/assets/images/canaisatt-0a4ad7146db8266b8a15dfad3ae6a065.jpg)

##### Essa configuração pode ser definida também pelo WebrunAdmin:

![canaisatt.jpg](/assets/images/canaisattadmin-f8667c04638bab42bfafa1d831332ff0.png)

# 🧩 Componentes Adicionais da IDE

A IDE Maker AI inclui componentes adicionais que estendem os componentes básicos do formulário.
Cada componente é definido em um arquivo XML dentro de `Resources/PT/Components/` (ou `EN/Components/`).

## Resumo dos Componentes

Total: **23 componentes** em português (22 em inglês, sem QueryCopilot).

| # | Componente | Categoria | Propriedades | Eventos | Funções | Manual |
|---|-----------|-----------|:------------:|:-------:|:-------:|--------|
| 1 | **Aba** | Adicionais | 5 | 1 | 0 | [Link](https://manual.softwell.com.br/#/aba) |
| 2 | **Acao** | Adicionais | 9 | 1 | 0 | [Link](https://manual.softwell.com.br/#/acao) |
| 3 | **Accordion** | Adicionais | 8 | 2 | 0 | [Link](https://manual.softwell.com.br/#/accordion) |
| 4 | **Calendario** | Adicionais | 24 | 9 | 0 | [Link](https://manual.softwell.com.br/#/calendario) |
| 5 | **Card** | Adicionais | 26 | 2 | 0 | [Link](https://manual.softwell.com.br/#/card) |
| 6 | **Chat** | Adicionais | 47 | 7 | 0 | [Link](https://manual.softwell.com.br/#/chat) |
| 7 | **ColorPicker** | Adicionais | 4 | 1 | 0 | [Link](https://manual.softwell.com.br/#/colorpicker) |
| 8 | **Consulta** | Adicionais | 2 | 0 | 0 | [Link](https://manual.softwell.com.br/#/consulta) |
| 9 | **Galeria de Imagens** | Adicionais | 15 | 1 | 0 | [Link](https://manual.softwell.com.br/#/galeria_de_imagens) |
| 10 | **Grafico** | GoogleCharts | 11 | 2 | 3 | — |
| 11 | **Integracao** | Adicionais | 5 | 1 | 0 | [Link](https://manual.softwell.com.br/#/integracao) |
| 12 | **Listagem** | Maker 3 | 10 | 3 | 2 | [Link](https://manual.softwell.com.br/#/listagem) |
| 13 | **Menu** | Adicionais | 9 | 3 | 2 | [Link](https://manual.softwell.com.br/#/menu) |
| 14 | **MultiSelect** | Adicionais | 8 | 2 | 0 | [Link](https://manual.softwell.com.br/#/multiselect) |
| 15 | **Organograma** | GoogleCharts | 8 | 2 | 1 | [Link](https://manual.softwell.com.br/#/organograma) |
| 16 | **Player** | Adicionais | 10 | 4 | 0 | [Link](https://manual.softwell.com.br/#/player) |
| 17 | **QueryCopilot** | Adicionais | 37 | 3 | 0 | [Link](https://manual.softwell.com.br/#/chat) |
| 18 | **RSS** | Adicionais | 14 | 0 | 0 | [Link](https://manual.softwell.com.br/#/rss) |
| 19 | **Slider** | Adicionais | 6 | 1 | 0 | [Link](https://manual.softwell.com.br/#/slider) |
| 20 | **Slider Panel** | Adicionais | 7 | 1 | 0 | [Link](https://manual.softwell.com.br/#/slider_panel) |
| 21 | **Tabela** | Maker 3 | 24 | 10 | 12 | [Link](https://manual.softwell.com.br/#/tabela) |
| 22 | **Timer** | Adicionais | 11 | 3 | 0 | [Link](https://manual.softwell.com.br/#/timer) |
| 23 | **Upload** | Adicionais | 1 | 2 | 0 | [Link](https://manual.softwell.com.br/#/upload) |

### Categorias

- **Adicionais** (19): Aba, Acao, Accordion, Calendario, Card, Chat, ColorPicker, Consulta, Galeria de Imagens, Integracao, Menu, MultiSelect, Player, QueryCopilot, RSS, Slider, Slider Panel, Timer, Upload
- **GoogleCharts** (2): Grafico, Organograma
- **Maker 3** (2): Listagem, Tabela

---

## Aba

- **Categoria:** Adicionais
- **Pasta:** `Components/Aba/`
- **Manual:** https://manual.softwell.com.br/#/aba
- **Versão:** 0.0.1b

### Propriedades

| Propriedade | Nome Interno | Tipo | Valor Padrão |
|------------|-------------|------|-------------|
| Lista de Formulários | `ListaDeFormularios` | url | — |
| Permitir Fechar Aba | `FecharAba` | boolean | true |
| Permitir Desdocar Formulário | `Desdocar` | boolean | false |
| Acessível | `Acessivel` | List | 1 |
| Tamanho Máximo das Abas | `autoAjuste` | text | 0 |

#### Valores de Lista

**Acessível** (`Acessivel`):

- `0` — Modo Inclusão/Alteração
- `1` — Todos os modos

### Eventos

| Evento | Nome Interno |
|--------|-------------|
| Ao Clicar | `AoClicar` |

---

## Acao

- **Categoria:** Adicionais
- **Pasta:** `Components/Acao/`
- **Manual:** https://manual.softwell.com.br/#/acao

### Propriedades

| Propriedade | Nome Interno | Tipo | Valor Padrão |
|------------|-------------|------|-------------|
| Ação Pré-Definida | `AcoesPreDefinida` | List | — |
| Imagem | `Image` | Image | — |
| Imagem Ao Clicar | `ImageOnClick` | Image | — |
| Imagem Ao Passar o Mouse | `ImageMouseOver` | Image | — |
| URL Imagem | `URLImage` | text | — |
| URL Imagem Ao Clicar | `URLImageOnClick` | text | — |
| URL Imagem Ao Passar o Mouse | `URLImageMouseOver` | text | — |
| Acessível | `Acessivel` | List | 1 |
| Modo de Exibição da Imagem | `ImageViewMode` | List | 0 |

#### Valores de Lista

**Ação Pré-Definida** (`AcoesPreDefinida`):

- `ConfigurarConexoesAdicionais` — Configurar Conexões Adicionais
- `Grupos` — Grupos
- `Usuarios` — Usuários
- `LOG` — LOG
- `AlterarSenha` — Alterar Senha
- `ExecutarScriptSQL` — Executar Script SQL
- `RecarregarSistema` — Recarregar Sistema
- `ModoNormal` — Modo Normal
- `ModoGerente` — Modo Gerente
- `ModoProjeto` — Modo Projeto
- `AlterarUsuario` — Alterar Usuário
- `Sair` — Sair
- `Incluir` — Modo de Inserção
- `Alterar` — Modo de Alteração
- `Excluir` — Excluir
- `Gravar` — Gravar
- `GravarMais` — Gravar +
- `Cancelar` — Cancelar
- `PrimeiroReg` — Primeiro registro
- `AnteriorReg` — Registro anterior
- `ProximoReg` — Próximo registro
- `UltimoReg` — Último registro

**Acessível** (`Acessivel`):

- `0` — Modo Inclusão/Alteração
- `1` — Todos os modos

**Modo de Exibição da Imagem** (`ImageViewMode`):

- `0` — Ajustar Imagem
- `1` — Centralizado

### Eventos

| Evento | Nome Interno |
|--------|-------------|
| Ao Clicar | ` Ao Clicar` |

---

## Accordion

- **Categoria:** Adicionais
- **Pasta:** `Components/Accordion/`
- **Manual:** https://manual.softwell.com.br/#/accordion

### Propriedades

| Propriedade | Nome Interno | Tipo | Valor Padrão |
|------------|-------------|------|-------------|
| Descrição | `description` | text | — |
| Fonte de Dados | `FonteDeDados` | text | — |
| SQL | `consultaSQL` | SQL | — |
| Seções | `ListaTitulo` | url | — |
| Cor da Fonte | `corFonteElemento` | color | — |
| Orientação | `orientacao` | List | 1 |
| Acessível | `Acessivel` | List | 1 |
| Limitar Conteúdo | `LimitarConteudo` | boolean | True |

#### Valores de Lista

**Orientação** (`orientacao`):

- `1` — Horizontal
- `2` — Vertical

**Acessível** (`Acessivel`):

- `0` — Modo Inclusão/Alteração
- `1` — Todos os modos

### Eventos

| Evento | Nome Interno |
|--------|-------------|
| Ao Expandir | `Ao Expandir` |
| Ao Contrair | `Ao Contrair` |

---

## Calendario

- **Categoria:** Adicionais
- **Pasta:** `Components/Calendario/`
- **Manual:** https://manual.softwell.com.br/#/calendario

### Propriedades

| Propriedade | Nome Interno | Tipo | Valor Padrão |
|------------|-------------|------|-------------|
| Fonte de Dados | `FonteDeDados` | text | — |
| SQL Feriado | `consultaSQL` | SQL | — |
| Campo Data | `campoData` | Field | — |
| Campo Descrição | `campoDescricao` | Field | — |
| SQL Atividade | `consultaSQLAtividade` | SQL | — |
| Campo ID | `campoIDAtividade` | Field | — |
| Campo Data Início | `campoDataAtividade` | Field | — |
| Campo Data Fim | `campoDataFimAtividade` | Field | — |
| Campo Descrição | `campoDescricaoAtividade` | Field | — |
| Campo Cor | `campoCorAtividade` | Field | — |
| Campo Cor Fonte | `campoCorFonteAtividade` | Field | — |
| Integrar Google Calendar | `integrarGoogleCalendar` | boolean | false |
| Id do Cliente | `idCliente` | Field | — |
| Chave da API | `chaveApi` | Field | — |
| Navegação | `Navegacao` | boolean | True |
| Editável | `Editavel` | boolean | True |
| Formulário de Edição | `FormularioDeEdicao` | List | — |
| Exibir Números dos Dias | `ExibirNumerosDosDias` | boolean | True |
| Botão Avançar Para Dia Atual | `ExibirBotaoHoje` | boolean | True |
| Exibir Mês e Ano Atual | `ExibirTitulo` | boolean | True |
| Destacar Horário Comercial | `DestacarHorarioComercial` | boolean | True |
| Modo de Visualização | `ModoDeVisualizacao` | List | 1 |
| Permitir Alterar Modo de Visualização | `PermitirAlterarModoDeVisualizacao` | boolean | True |
| Menu de Contexto | `MenuDeContexto` | boolean | True |

#### Valores de Lista

**Modo de Visualização** (`ModoDeVisualizacao`):

- `1` — Mês
- `2` — Semana
- `3` — Dia

### Eventos

| Evento | Nome Interno |
|--------|-------------|
| Ao Atualizar | `AoAtualizar` |
| Ao Modificar Mês | `AoModificarMes` |
| Ao Modificar Ano | `AoModificarAno` |
| Ao Clicar no Dia | `AoClicarNoDia` |
| Ao Clicar no Evento | `AoClicarNoEvento` |
| Ao Mover Evento | `AoMoverEvento` |
| Ao Redimensionar Evento | `AoRedimensionarEvento` |
| Ao Abrir Menu de Contexto | `AoAbrirMenuDeContexto` |
| Ao Fechar Menu de Contexto | `AoFecharMenuDeContexto` |

---

## Card

- **Categoria:** Adicionais
- **Pasta:** `Components/Card/`
- **Manual:** https://manual.softwell.com.br/#/card

### Propriedades

| Propriedade | Nome Interno | Tipo | Valor Padrão |
|------------|-------------|------|-------------|
| Editavel | `cardEditable` | List | false |
| Formulário | `cardForm` | List | — |
| Fonte de Dados | `FonteDeDados` | text | — |
| Consulta SQL | `QuerySQL` | SQL | — |
| Campo ID | `IDField` | Field | — |
| Campo Título | `TitleField` | Field | — |
| Campo Título do Corpo | `BodyTitleField` | Field | — |
| Campo Texto do Corpo | `BodyTextField` | Field | — |
| Campo Texto do Rodapé | `FooterTextField` | Field | — |
| Campo Imagem | `ImageField` | Field | — |
| Altura dos Cartões | `cardsHeight` | integer | — |
| Tamanho dos Cartões | `cardsWidth` | integer | — |
| Quantidade de Colunas | `numberOfColumns` | integer | — |
| Alinhamento do Texto | `textAlign` | List | left |
| Cor de Fundo | `backgroundColor` | color | clWindow |
| Estilo Bootstrap | `boostrapStyle` | List | transparent |
| Exibição da Imagem | `imageDisplay` | list | cover |
| Posição da Imagem | `imagePosition` | list | left |
| Fonte | `Fonte` | font | MS Sans Serif,8,0000,clWindowText |
| Estilo (CSS) | `cssStyle` | text | — |
| Título | `title` | text | — |
| Título do Corpo | `bodyTitle` | text | — |
| Texto do Corpo | `bodyText` | text | — |
| Texto do Rodapé | `footerText` | text | — |
| Imagem | `bodyImage` | Image | — |
| URL Imagem | `urlImage` | text | — |

#### Valores de Lista

**Editavel** (`cardEditable`):

- `false` — Não
- `true` — Sim

**Alinhamento do Texto** (`textAlign`):

- `left` — Esquerda
- `right` — Direita
- `center` — Centro

**Estilo Bootstrap** (`boostrapStyle`):

- `transparent` — 
- `primary` — Primary
- `secondary` — Secondary
- `success` — Success
- `danger` — Danger
- `warning` — Warning
- `info` — Info
- `light` — Light
- `dark` — Dark

**Exibição da Imagem** (`imageDisplay`):

- `contain` — Ajustar
- `cover` — Preencher
- `fill` — Estender

**Posição da Imagem** (`imagePosition`):

- `left` — Esquerda
- `right` — Direita
- `top` — Acima
- `bottom` — Abaixo

### Eventos

| Evento | Nome Interno |
|--------|-------------|
| Ao Clicar | `onClick` |
| Ao Preencher | `onFilling` |

---

## Chat

- **Categoria:** Adicionais
- **Pasta:** `Components/Chat/`
- **Manual:** https://manual.softwell.com.br/#/chat

### Propriedades

| Propriedade | Nome Interno | Tipo | Valor Padrão |
|------------|-------------|------|-------------|
| Instância | `Instancia` | text | — |
| Fonte de Dados | `FonteDeDados` | text | — |
| Usuários do Sistema | `UsuariosSistema` | SQL | Select fr_usuario.usr_codigo, fr_usua... |
| Campo ID | `CampoID` | Field | usr_codigo |
| Campo Nome | `CampoNome` | Field | usr_nome |
| Campo Foto | `CampoFoto` | Field | usr_foto |
| Salvar Histórico | `SalvarHistorico` | boolean | false |
| SQL Histórico | `SQLHistorico` | SQL | — |
| Campo ID | `CampoIDHistorico` | Field | — |
| Campo Data | `CampoDataHistorico` | Field | — |
| Campo Status | `CampoStatusHistorico` | Field | — |
| Campo Remetente | `CampoRemetenteHistorico` | Field | — |
| Campo Destinatário | `CampoDestinatarioHistorico` | Field | — |
| Campo Grupo | `CampoGrupoHistorico` | Field | — |
| Campo Conteúdo | `CampoConteudoHistorico` | Field | — |
| Campo ID Mídia | `CampoIDMidiaHistorico` | Field | — |
| Campo Tipo Mídia | `CampoTipoMidiaHistorico` | Field | — |
| Campo Arquivo Mídia | `CampoArquivoMidiaHistorico` | Field | — |
| Exibir Notificações na Área de Trab. | `ExibirNotificacoesAreaDeTrabalho` | boolean | true |
| Exibir Confirmação de Leitura | `ConfirmacaoLeitura` | boolean | true |
| Exibir Estado dos Usuários | `ExibirEstados` | boolean | true |
| Exibir Visto por Último | `ExibirVistoPorUltimo` | boolean | true |
| Exibir Pesquisa | `ExibirPesquisa` | boolean | true |
| Exibir Enviar para Todos | `EnviarTodos` | boolean | false |
| Expandir Foto ao Clicar | `ExpandirFotoAoClicar` | boolean | true |
| Permitir Exportação | `PermitirExportacao` | boolean | true |
| Permitir Envio de Mídias | `PermitirEnvioDeMidias` | boolean | true |
| Permitir Criação de Grupos | `PermitirCriacaoDeGrupos` | boolean | true |
| Formulário de Grupos | `FormularioDeGrupos` | List | — |
| SQL Grupos | `SQLGrupos` | SQL | — |
| Campo ID Grupo | `CampoIDGrupo` | Field | — |
| Campo Nome Grupo | `CampoNomeGrupo` | Field | — |
| Campo Foto Grupo | `CampoFotoGrupo` | Field | — |
| SQL Grupos Usuários | `SQLGruposUsuarios` | SQL | — |
| Campo ID Grupo | `CampoGrupoIDGrupo` | Field | — |
| Campo ID Usuário | `CampoGrupoIDUsuario` | Field | — |
| Campo Administrador | `CampoGrupoAdministrador` | Field | — |
| Ocupar Área do Formulário | `TelaCheia` | boolean | false |
| Limite de Caracteres | `LimiteDeCaracteres` | integer | 5000 |
| Quantidade de Mensagens Carregadas | `QuantMensagensCarregadas` | integer | 15 |
| Imagem Usuário Sem Foto | `ImagemSemFoto` | Image | — |
| Imagem Grupo Sem Foto | `ImagemGrupoSemFoto` | Image | — |
| Tamanho das Fotos | `TamanhoDasFotos` | integer | 48 |
| Modo de Visualização | `ModoDeVisualizacao` | List | 1 |
| Acessível | `Acessivel` | List | 1 |
| Estilo (CSS) | `EstiloCss` | text | — |
| Estilo Mobile (CSS) | `EstiloMobileCss` | text | — |

#### Valores de Lista

**Modo de Visualização** (`ModoDeVisualizacao`):

- `1` — Automático
- `2` — Desktop
- `3` — Mobile

**Acessível** (`Acessivel`):

- `0` — Modo Inclusão/Alteração
- `1` — Todos os modos

### Eventos

| Evento | Nome Interno |
|--------|-------------|
| Ao Conectar | `Ao Conectar` |
| Ao Desconectar | `Ao Desconectar` |
| Ao Enviar Mensagem | `Ao Enviar Mensagem` |
| Ao Receber Mensagem | `Ao Receber Mensagem` |
| Ao Enviar Mídia | `Ao Enviar Midia` |
| Ao Carregar Mídia | `Ao Carregar Midia` |
| Ao Abrir Conversa | `Ao Abrir Conversa` |

---

## ColorPicker

- **Categoria:** Adicionais
- **Pasta:** `Components/ColorPicker/`
- **Manual:** https://manual.softwell.com.br/#/colorpicker

### Propriedades

| Propriedade | Nome Interno | Tipo | Valor Padrão |
|------------|-------------|------|-------------|
| Campo | `Campo` | Field | — |
| Descrição | `Descricao` | Letras | — |
| Acessível | `Acessivel` | List | 0 |
| Opacidade | `opacidade` | boolean | false |

#### Valores de Lista

**Acessível** (`Acessivel`):

- `0` — Modo Inclusão/Alteração
- `1` — Todos os modos

### Eventos

| Evento | Nome Interno |
|--------|-------------|
| Ao Modificar | ` Ao Modificar` |

---

## Consulta

- **Categoria:** Adicionais
- **Pasta:** `Components/Consulta/`
- **Manual:** https://manual.softwell.com.br/#/consulta

### Propriedades

| Propriedade | Nome Interno | Tipo | Valor Padrão |
|------------|-------------|------|-------------|
| Configurações | `JsonConfiguracao` | url | — |
| Limite de Registros | `LimiteRegistros` | integer | 10 |

---

## Galeria de Imagens

- **Categoria:** Adicionais
- **Pasta:** `Components/GaleriaImagens/`
- **Manual:** https://manual.softwell.com.br/#/galeria_de_imagens

### Propriedades

| Propriedade | Nome Interno | Tipo | Valor Padrão |
|------------|-------------|------|-------------|
| Descrição | `description` | text | — |
| Fonte de Dados | `FonteDeDados` | text | — |
| SQL | `consultaSQL` | SQL | — |
| Campo ID | `campoID` | Field | — |
| Campo Miniatura | `campoMiniatura` | Field | — |
| Campo Imagem | `campoImagem` | Field | — |
| Orientação | `BarraRolagem` | List | V |
| Altura Miniatura | `AlturaMiniatura` |  | 83 |
| Tamanho Miniatura | `TamanhoMiniatura` |  | 138 |
| Permitir Download | `PermitirDownload` | boolean | False |
| Permitir Upload | `PermitirUpload` | boolean | True |
| Permitir Exclusão | `PermitirExclusao` | boolean | True |
| Expandir ao Clicar | `ExpandirAoClicar` | boolean | True |
| Bordas | `Bordas` | boolean | True |
| Acessível | `Acessivel` | List | 1 |

#### Valores de Lista

**Orientação** (`BarraRolagem`):

- `H` — Horizontal
- `V` — Vertical

**Acessível** (`Acessivel`):

- `0` — Modo Inclusão/Alteração
- `1` — Todos os modos

### Eventos

| Evento | Nome Interno |
|--------|-------------|
| Ao Selecionar | `AoSelecionar` |

---

## Grafico

- **Categoria:** GoogleCharts
- **Pasta:** `Components/Grafico/`

### Propriedades

| Propriedade | Nome Interno | Tipo | Valor Padrão |
|------------|-------------|------|-------------|
| Título do Gráfico | `TituloGrafico` | text | — |
| Cor do Fundo | `CorFundo` | color | clBtnFace |
| Cor do Gráfico | `CorGrafico` | color | clTeal |
| Exibir Legenda | `ExibirLegenda` | boolean | true |
| Posição da Legenda | `PosicaoLegenda` | list | right |
| Título do Eixo Y | `TituloEixoY` | text | — |
| Título do Eixo X | `TituloEixoX` | text | — |
| Série | `gSerie` | url | — |
| Exibir Animação | `animation` | boolean | true |
| Duração (Animação) (ms) | `animationTime` |  | 500 |
| Área Útil (%) | `areautil ` |  | 0 |

#### Valores de Lista

**Posição da Legenda** (`PosicaoLegenda`):

- `right` — Direita
- `top` — Topo
- `bottom` — Baixo

### Eventos

| Evento | Nome Interno |
|--------|-------------|
| Ao Selecionar | `Ao Clicar` |
| Iniciar Gráfico | `AoIniciarGrafico` |

### Funções

#### Gráfico Gauge - Novo

```
Essa função cria um componente Gráfico Gauge dinamicamente.
      
Parâmetros:
1. Nome da Aba.
2. Posição X.
3. Posição Y.
4. Altura.
5. Largura.
6. Visivel?
7. Habilitado?
8. Nome do Componente.
9. Consulta SQL.
10. Lista com Valores (Ver observação 1).
11. Valor Mínimo.
12. Valor Máximo.
13. Lista de Faixas(Ver observação 2).

Observações:
1. O décimo parâmetro substitui a consulta SQL passado no nono parâmetro.
2. O parâmetro Lista de Faixas deve ser uma lista contendo três listas. Cada uma das listas devem possuir dois itens que são o valor mínimo e máximo de cada faixa respectivamente.
```

**Parâmetros:**

1. `Aba` — Letras
2. `Posição X` — Inteiro
3. `Posição Y` — Inteiro
4. `Altura` — Inteiro
5. `Tamanho` — Inteiro
6. `Visível` — Lógico
7. `Habilitado` — Lógico
8. `Nome do Componente` — Letras
9. `Consulta SQL` — Letras
10. `Mapa com Valores` — Variante
11. `Valor Mínimo` — Inteiro
12. `Valor Máximo` — Inteiro
13. `Lista de Faixas` — Variante

#### Gráfico - Recarregar Componente

```
Essa função recarrega o componente gráfico passado via parâmetro.

Parâmetro(s):
1. Nome do Componente;

Retorno:
Não possui.
```

**Parâmetros:**

1. `Nome do Componente` — Letras

#### Gráfico - Séries Novo

```
Essa função cria um componente Gráfico dinamicamente.
      
Parâmetros:
1. Nome da Aba.
2. Posição X.
3. Posição Y.
4. Altura.
5. Largura.
6. Visível?
7. Habilitado?
8. Nome do Componente.
9. Séries (Ver observação 1).
10. Título (Opcional).
11. Título do Eixo Y (Opcional).
12. Título do Eixo X (Opcional).
13. Exibir Legenda.
14. Posição da Legenda (Ver observação 4).
15. Cor de Fundo (Nulo caso o fundo do componente seja transparente).
16. Cor de Gráfico (Ver Observação 5).
17. Exibir Animação?.
18. Duração da Animação (ms).
19. Evento ao Selecionar (Ver Observação 6).
20. Lista com Valores (Ver observação 2).
21. Área Útil (%) (Opcional).

Observações:
1. Deverá ser passado uma lista contendo uma lista com os parâmetros: Nome, Tipo(Ver observação 3) , SQL, Campos (separado por ";", lembrando que o primeiro campo deve ser obrigatoriamente do tipo "Letras".
2. O vigésimo parâmetro substitui a consulta SQL passado no nono parâmetro.
3. Tipos suportados: Barra, Área, Linha, Pizza, Gantt, Barra horizontal, Área Horizontal.
4. Posições suportadas: Direita, Topo, Baixo.
5. Caso o componente contenha várias séries ou o seja do tipo Pizza, esta propriedade será ignorada.
6. Lista de Lista. O primeiro parâmetro da lista será o nome do fluxo e o segundo uma lista com os parâmetros do fluxo. Lembrando que o fluxo vinculado recebe 3 parâmetros automáticos, são eles: Nome da Série, Valor do item selecionado e Descrição do item selecionado respectivamente.
7. A lista de campos deve seguir a ordem da interface (Propriedade Séries) de acordo com o tipo do Gráfico. 
   Ex.: 
     Gantt: Campo ID da Tarefa, Campo Nome da Tarefa, Campo Id do Grupo, Campo Data Início, Campo Data Fim, Campo Porcentagem da Tarefa, Campo Dependências
     Barra: Campo Etiqueta, Campo Valor Y, Campo Cor;
```

**Parâmetros:**

1. `Aba` — Letras
2. `Posição X` — Inteiro
3. `Posição Y` — Inteiro
4. `Altura` — Inteiro
5. `Tamanho` — Inteiro
6. `Visível` — Lógico
7. `Habilitado` — Lógico
8. `Nome do Componente` — Letras
9. `Séries` — Variante
10. `Título` — Letras
11. `Título do Eixo Y` — Letras
12. `Título do Eixo X` — Letras
13. `Exibir Legenda` — Lógico
14. `Posição da Legenda` — Letras
15. `Cor de Fundo` — Cor
16. `Cor do Gráfico` — Cor
17. `Exibir Animação?` — Lógico
18. `Duração da Animação` — Inteiro
19. `Evento ao Selecionar` — Variante
20. `Lista com Valores` — Letras
21. `Área Útil` — Inteiro

---

## Integracao

- **Categoria:** Adicionais
- **Pasta:** `Components/Integracao/`
- **Manual:** https://manual.softwell.com.br/#/integracao

### Propriedades

| Propriedade | Nome Interno | Tipo | Valor Padrão |
|------------|-------------|------|-------------|
| Posicionamento | `Posicionamento` | List | A |
| Alinhamento Horizontal | `AlinhamentoH` | List | N |
| Alinhamento Vertical | `AlinhamentoV` | List | N |
| Estrutura | `Configuracoes` | url | — |
| Abrir como Página | `Iframe` | boolean | true |

#### Valores de Lista

**Posicionamento** (`Posicionamento`):

- `A` — Absoluto
- `R` — Relativo
- `C` — Área

**Alinhamento Horizontal** (`AlinhamentoH`):

- `N` — Nenhum
- `E` — Esquerda
- `C` — Centro
- `D` — Direita

**Alinhamento Vertical** (`AlinhamentoV`):

- `N` — Nenhum
- `T` — Topo
- `C` — Centro
- `R` — Rodapé

### Eventos

| Evento | Nome Interno |
|--------|-------------|
| Depois de Carregar | `Depois de Carregar` |

---

## Listagem

- **Categoria:** Maker 3
- **Pasta:** `Components/Listagem/`
- **Manual:** https://manual.softwell.com.br/#/listagem

### Propriedades

| Propriedade | Nome Interno | Tipo | Valor Padrão |
|------------|-------------|------|-------------|
| SQL | `SQL` | sql | — |
| Nome Relatório | `nomerelatorio` | text | — |
| Modo de Visualização | `modeView` | List | A |
| Fonte de Dados | `FonteDeDados` | text | — |
| Template | `XMLTemplate` | url | — |
| Acessível Todos Modos | `AcessivelTodosModos` | boolean | false |
| Msg Aguarde | `MsgAguarde` | text | Aguarde... A listagem está sendo gerada! |
| Gravar Log | `GravarLog` | boolean | true |
| Caminho dos Relatórios | `CaminhoRelatorio` | text | — |
| Permitir Mudar Consulta | `PermitirMudarConsulta` | boolean | false |

#### Valores de Lista

**Modo de Visualização** (`modeView`):

- `A` — Modo Avançado
- `C` — Modo Clássico

### Eventos

| Evento | Nome Interno |
|--------|-------------|
| Antes de Imprimir | `AntesdeImprimir` |
| Ao Modificar Consulta | `AoModificarConsulta` |
| Ao Clicar em Consulta | `AoClicarEmConsulta` |

### Funções

#### Listagem - Imprimir

```
Gera a Listagem referênciado no primeiro parâmetro tomando como base o mapa com os parâmetros passados.
        Parâmetros:
          1. Nome do Componente Listagem.
          2. Formato para Gerar.
          3. Nome da Listagem Salva
          4. Json de campos, tendo como valor outro json.
            Ex: {"Campo1":
                          {"Operador":"=",
                          "Filtro_Inicial":"valorinicial",
                          "Filtro_Final":"valorfinal"
                          }
                  ,"Campo2":
                          {"Operador":"=",
                          "Filtro_Inicial":"valorinicial",
                          "Filtro_Final":"valorfinal"
                          }
                  }
          5. Abrir arquivo gerado? (Lógico, Opcional)
          6. Nome da Regra a ser Executa após gerar a Listagem (Letras, Servidor, Opcional).
          7. Texto que Será Exibido no contador de Registros.
          8. Conexão Adicional(Opicional).
          9. Diretório de arquivos de Listagens(Opicional).
          10. Exibir botão Imprimir no Mala Direta.
              Retorno:
                Não possui.
```

**Parâmetros:**

1. `Nome do Componente` — Letras
2. `Formato` — Letras
3. `Nome da Versão` — Letras
4. `Json Campos e Filtros` — Variante
5. `Abrir` — Lógico
6. `Nome da Regra` — Letras
7. `Texto do Contador` — Letras
8. `Conexão Adicional` — Letras
9. `Diretório` — Letras
10. `Exibir Imprimir` — Lógico
11. `Salvar em Banco` — Lógico

#### Listagem - Definir Texto do Totalizador

```
Altera o texto de contagem de registros da Listagem referênciado no primeiro parâmetro.
        Parâmetros:
          1. Nome do Componente Listagem.
          2. Texto do totalizador.
              Retorno:
                Não possui.
```

**Parâmetros:**

1. `Nome do Componente` — Letras
2. `Texto` — Letras

---

## Menu

- **Categoria:** Adicionais
- **Pasta:** `Components/Menu/`
- **Manual:** https://manual.softwell.com.br/#/menu

### Propriedades

| Propriedade | Nome Interno | Tipo | Valor Padrão |
|------------|-------------|------|-------------|
| Estrutura do Menu | `XMLMenu` | url | — |
| Menu Legado | `MenuLegado` | boolean | false |
| Ativar Pesquisa | `PesquisaMenu` | boolean | false |
| Posição da Pesquisa | `PosicaoPesquisa` | List | L |
| Texto da Pesquisa | `PlaceHolder` | text | Buscar no menu |
| Componente Aba | `MenuAbas` | Letras | — |
| Orientação | `Orientacao` | List | H |
| Alinhamento | `Alinhamento` | List | N |
| Auto Retrair | `AutoRetrair` | boolean | true |

#### Valores de Lista

**Posição da Pesquisa** (`PosicaoPesquisa`):

- `T` — Acima
- `B` — Abaixo
- `L` — Esquerda
- `R` — Direita

**Orientação** (`Orientacao`):

- `H` — Horizontal
- `V` — Vertical

**Alinhamento** (`Alinhamento`):

- `N` — Nenhum
- `T` — Acima
- `L` — Esquerda
- `R` — Direita

### Eventos

| Evento | Nome Interno |
|--------|-------------|
| Antes de Carregar | `Antes de Carregar` |
| Ao Soltar Atalho | `Ao Soltar Atalho` |
| Ao Clicar | `Ao Clicar` |

### Funções

#### Menu - Atualizar

```
Atualiza o menu referênciado no primeiro parâmetro tomando como 
base o conteúdo XML informado no segundo parâmetro.

Parâmetros:
1. Nome do componente Menu.
2. Conteúdo XML.

Retorno:
Não possui.
```

**Parâmetros:**

1. `Nome do Componente` — Letras
2. `Conteúdo XML` — Letras

#### Menu - Definir Permissão

```
Essa função define a permissão de acesso ao componente Menu.

Parâmetros:
1. Nome do componente Menu.
2. Lista de itens.
3. Visível?
4. Habilitado?

Retorno:
Não possui.

Observações:
1. Essa função não sobreescreve a permissão "Visível" definida como "Não" através do modo gerente.
2. Para obter o item do menu utilize a opção Visualizar XML disponível na propriedade Estrutura do Menu. O item será o código do menu através do atributo "CODE"
```

**Parâmetros:**

1. `Nome do Componente` — Letras
2. `Lista de Itens` — Variante
3. `Visível` — Lógico
4. `Habilitado` — Lógico

---

## MultiSelect

- **Categoria:** Adicionais
- **Pasta:** `Components/MultiSelect/`
- **Manual:** https://manual.softwell.com.br/#/multiselect

### Propriedades

| Propriedade | Nome Interno | Tipo | Valor Padrão |
|------------|-------------|------|-------------|
| Campo | `Campo` | Field | — |
| Descrição | `Descricao` | letras | — |
| Fonte de Dados | `FonteDeDados` | text | — |
| Consulta SQL | `consultaSQL` | SQL | — |
| Campo Chave | `campoChave` | Field | — |
| Campo Lista | `campoLista` | Field | — |
| Lista | `Lista` | list | — |
| Valores | `Valores` | list | — |

### Eventos

| Evento | Nome Interno |
|--------|-------------|
| Ao Selecionar | `AoSelecionar` |
| Ao Remover | `AoRemover` |

---

## Organograma

- **Categoria:** GoogleCharts
- **Pasta:** `Components/Organograma/`
- **Manual:** https://manual.softwell.com.br/#/organograma

### Propriedades

| Propriedade | Nome Interno | Tipo | Valor Padrão |
|------------|-------------|------|-------------|
| Fonte de Dados | `FonteDeDados` | text | — |
| SQL | `consultaSQL` | SQL | — |
| Raiz | `inicio` | text | Organograma |
| Estrutura | `estrutura` | url | — |
| Permitir Contrair? | `contrair` | boolean | true |
| Renderizar HTML? | `tags` | boolean | true |
| Barra de Rolagem | `Scroll` | boolean | true |
| Tamanho do Item | `tamanhoItem` | List | medium |

#### Valores de Lista

**Tamanho do Item** (`tamanhoItem`):

- `small` — Pequeno
- `medium` — Médio
- `large` — Grande

### Eventos

| Evento | Nome Interno |
|--------|-------------|
| Ao Expandir | `AoExpandir` |
| Ao Clicar | `AoClicar` |

### Funções

#### Organograma - Novo

```
Essa função cria um componente Organograma dinamicamente.
    
Parâmetros:
1. Nome da Aba.
2. Posição X.
3. Posição Y.
4. Largura.
5. Altura.
6. Dica.
7. Nome do Componente.
8. Consulta SQL.
9. Contrair?
10. Habilitado?
11. Visível?
12. Renderizar HTML?
13. Tamanho do Item (Ver observação 1)
14. Fluxo a ser executado quando clicado.
15. Scroll habilitado?
16. Container.

Observação:
1. Os tamanhos suportados são: Pequeno, Médio ou Grande.
2. Lista de Lista. O primeiro parâmetro da lista será o nome do fluxo e o segundo uma lista com os parâmetros do fluxo.
Retorno: 
Não possui.
```

**Parâmetros:**

1. `Aba` — Letras
2. `Posição X` — Letras
3. `Posição Y` — Letras
4. `Tamanho` — Letras
5. `Altura` — Letras
6. `Dica` — Letras
7. `Nome do Componente` — Letras
8. `Consulta SQL` — Letras
9. `Contrair?` — Lógico
10. `Habilitado?` — Lógico
11. `Visível?` — Lógico
12. `Renderizar HTML?` — Lógico
13. `Tamanho do Item` — Letras
14. `Fluxo` — Variante
15. `Scroll?` — Lógico
16. `Container` — Letras

---

## Player

- **Categoria:** Adicionais
- **Pasta:** `Components/Player/`
- **Manual:** https://manual.softwell.com.br/#/player

### Propriedades

| Propriedade | Nome Interno | Tipo | Valor Padrão |
|------------|-------------|------|-------------|
| Tipo de mídia | `tipomidia` | List | audio |
| Reprodução Automática | `autoPlay` | boolean | false |
| Exibir Controles | `controles` | boolean | true |
| Modo Repetição | `loop` | boolean | false |
| Volume | `volume` |  | 100 |
| Mudo | `mudo` | boolean | false |
| Velocidade de Reprodução | `playbackRate` |  | 100 |
| URLs | `Lista` | list | — |
| Legendas | `Valores` | list | — |
| Permitir Download | `allowDownload` | boolean | true |

#### Valores de Lista

**Tipo de mídia** (`tipomidia`):

- `audio` — Áudio
- `video` — Vídeo

### Eventos

| Evento | Nome Interno |
|--------|-------------|
| Ao Iniciar Reprodução | `AoIniciarReproducao` |
| Ao Finalizar Reprodução | `AoFinalizarReproducao` |
| Ao Pausar | `AoPausar` |
| Ao Ocorrer Erro | `AoOcorrerErro` |

---

## QueryCopilot

- **Categoria:** Adicionais
- **Pasta:** `Components/QueryCopilot/`
- **Manual:** https://manual.softwell.com.br/#/chat

### Propriedades

| Propriedade | Nome Interno | Tipo | Valor Padrão |
|------------|-------------|------|-------------|
| Instância | `Instancia` | text | — |
| Fonte de Dados | `FonteDeDados` | text | — |
| Tipo de LLM | `LLMTipo` | List | openai |
| URL da API LLM | `LLMApiUrl` | text | https://api.openai.com/v1/chat/comple... |
| Modelo LLM | `LLMModelo` | text | gpt-5.1-mini |
| Componente com API Key | `LLMApiKeyComponent` | text | — |
| Prompt de Sistema da LLM | `LLMSystemPrompt` | text | Você é um assistente especializado em... |
| Endpoint Query Copilot (Regra/URL backend) | `SqlCopilotEndpoint` | text | — |
| Componente da Conexão (ID/Alias do Banco) | `DbConnectionComponent` | text | — |
| SQL Schema (Tabelas/Colunas do BD) | `SQLSchema` | SQL | — |
| Campo Tabela (Schema) | `CampoTabelaSchema` | Field | — |
| Campo Coluna (Schema) | `CampoColunaSchema` | Field | — |
| Campo Tipo (Schema) | `CampoTipoSchema` | Field | — |
| Campo Descrição Tabela (Schema) | `CampoDescricaoTabelaSchema` | Field | — |
| Componente com Schema (JSON) | `SchemaComponent` | text | — |
| Salvar Histórico | `SalvarHistorico` | boolean | false |
| SQL Histórico | `SQLHistorico` | SQL | — |
| Campo ID | `CampoIDHistorico` | Field | — |
| Campo Data | `CampoDataHistorico` | Field | — |
| Campo Status | `CampoStatusHistorico` | Field | — |
| Campo Remetente | `CampoRemetenteHistorico` | Field | — |
| Campo Destinatário | `CampoDestinatarioHistorico` | Field | — |
| Campo Grupo | `CampoGrupoHistorico` | Field | — |
| Campo Conteúdo | `CampoConteudoHistorico` | Field | — |
| Campo ID Mídia | `CampoIDMidiaHistorico` | Field | — |
| Campo Tipo Mídia | `CampoTipoMidiaHistorico` | Field | — |
| Campo Arquivo Mídia | `CampoArquivoMidiaHistorico` | Field | — |
| Nome exibido do Copilot | `CopilotName` | text | Query Copilot |
| Ocupar Área do Formulário | `TelaCheia` | boolean | false |
| Limite de Caracteres | `LimiteDeCaracteres` | integer | 5000 |
| Quantidade de Mensagens Carregadas | `QuantMensagensCarregadas` | integer | 15 |
| Imagem Copilot Sem Foto | `ImagemSemFoto` | Image | — |
| Tamanho das Fotos | `TamanhoDasFotos` | integer | 48 |
| Modo de Visualização | `ModoDeVisualizacao` | List | 1 |
| Acessível | `Acessivel` | List | 1 |
| Estilo (CSS) | `EstiloCss` | text | — |
| Estilo Mobile (CSS) | `EstiloMobileCss` | text | — |

#### Valores de Lista

**Tipo de LLM** (`LLMTipo`):

- `openai` — OpenAI compatível
- `azure` — Azure OpenAI
- `ollama` — Ollama / Local
- `outro` — Outro

**Modo de Visualização** (`ModoDeVisualizacao`):

- `1` — Automático
- `2` — Desktop
- `3` — Mobile

**Acessível** (`Acessivel`):

- `0` — Modo Inclusão/Alteração
- `1` — Todos os modos

### Eventos

| Evento | Nome Interno |
|--------|-------------|
| Ao Enviar Mensagem | `Ao Enviar Mensagem` |
| Ao Receber Mensagem | `Ao Receber Mensagem` |
| Ao Abrir Conversa | `Ao Abrir Conversa` |

---

## RSS

- **Categoria:** Adicionais
- **Pasta:** `Components/RSS/`
- **Manual:** https://manual.softwell.com.br/#/rss

### Propriedades

| Propriedade | Nome Interno | Tipo | Valor Padrão |
|------------|-------------|------|-------------|
| URL | `url` | text | — |
| Charset | `Charset` | text | — |
| Exibir Imagens | `ExibirImagens` | boolean | true |
| Tamanho das Imagens | `TamanhoDasImagens` |  | 25% |
| Exibir Títulos | `ExibirTitulos` | boolean | true |
| Exibir Descrições | `ExibirDescricoes` | boolean | true |
| Tamanho Máximo da Descrição | `TamanhoMaxDescricao` |  | 200 |
| Exibir Data de Publicação | `ExibirDataDePublicacao` | boolean | true |
| Abrir Links em Outra Aba | `novaaba` | boolean | true |
| Estilo do Conteúdo | `Estilo` | List | 0 |
| Tamanho Máximo dos Itens | `TamanhoMaxItens` |  | 100% |
| Modo de Exibição | `ModoDeExibicao` | List | 0 |
| Tempo de Espera (seg) | `tempo` | integer | 3 |
| Quantidade De Itens Por Vez | `qtditem` | integer | 3 |

#### Valores de Lista

**Estilo do Conteúdo** (`Estilo`):

- `0` — Padrão
- `1` — Cartão

**Modo de Exibição** (`ModoDeExibicao`):

- `0` — Animado
- `1` — Barra de Rolagem
- `2` — Livre

---

## Slider

- **Categoria:** Adicionais
- **Pasta:** `Components/Slider/`
- **Manual:** https://manual.softwell.com.br/#/slider
- **Versão:** 0.0.1b

### Propriedades

| Propriedade | Nome Interno | Tipo | Valor Padrão |
|------------|-------------|------|-------------|
| Valor Início | `ValorInicio` |  | 0 |
| Valor Final | `ValorFim` |  | 100 |
| Casas Decimais | `Precisao` |  | 0 |
| Valor Inicial do marcador | `ValorInicialMarcador` |  | 0 |
| Exibir Numeração | `ExibirNumeracao` | List | 1 |
| Acessível | `Acessivel` | List | 1 |

#### Valores de Lista

**Exibir Numeração** (`ExibirNumeracao`):

- `1` — Exibir
- `0` — Ocultar

**Acessível** (`Acessivel`):

- `0` — Modo Inclusão/Alteração
- `1` — Todos os modos

### Eventos

| Evento | Nome Interno |
|--------|-------------|
| Ao finalizar movimentação | `Ao finalizar movimentação` |

---

## Slider Panel

- **Categoria:** Adicionais
- **Pasta:** `Components/SliderPanel/`
- **Manual:** https://manual.softwell.com.br/#/slider_panel

### Propriedades

| Propriedade | Nome Interno | Tipo | Valor Padrão |
|------------|-------------|------|-------------|
| Lista de Imagens | `TabelaImagem` | url | — |
| Acessível | `Acessivel` | List | 0 |
| Exibição Imagem | `ExibicaoImagem` | List | cover |
| Tamanho da Fonte | `TamanhoFonte` |  | 12 |
| Tempo (ms) | `Tempo` |  | 5000 |
| Cor da Fonte do Texto | `CorFonteTexto` | color | clWhite |
| Cor do Indicador Ativo | `CorRodapeAtivo` | color | clSilver |

#### Valores de Lista

**Acessível** (`Acessivel`):

- `0` — Modo Inclusão/Alteração
- `1` — Todos os modos

**Exibição Imagem** (`ExibicaoImagem`):

- `cover` — Estender
- `contain` — Contendo
- `fill` — Preencher

### Eventos

| Evento | Nome Interno |
|--------|-------------|
| Ao Clicar | `Ao Clicar` |

---

## Tabela

- **Categoria:** Maker 3
- **Pasta:** `Components/Tabela/`
- **Manual:** https://manual.softwell.com.br/#/tabela

### Propriedades

| Propriedade | Nome Interno | Tipo | Valor Padrão |
|------------|-------------|------|-------------|
| Fonte de Dados | `FonteDeDados` | text | — |
| SQL | `SQL` | sql | — |
| Cabeçalho | `XMLPropriedades` | url | — |
| Permitir Inclusão | `PermitirInclusao` | boolean | true |
| Permitir Edição | `PermitirEdicao` | boolean | true |
| Permitir Exclusão | `PermitirExclusao` | boolean | true |
| Coluna Chave | `ColunaChave` | Field | — |
| Agrupamento | `Agrupamento` | boolean | false |
| Coluna Sumário | `ColunaSumario` | Field | — |
| Alinhamento Sumário | `AlinhamentoSumario` | List | left |
| Resumo Geral Sumário | `ResumoGeral` | boolean | false |
| Exibir Qtde Registros Sumário | `QuantidadeRegistros` | boolean | false |
| Operação | `Operacao` | List | sum |
| Tabela Principal | `TabelaPrincipal` | text | — |
| Texto do Resumo | `TextoResumo` | text | — |
| Cor Condicional | `CorCondicional` | colorconditional | — |
| Desabilitar Linhas | `DesabilitarLinha` | colorconditional | — |
| Auto-Ajuste do Conteúdo | `autoAjusteConteudo` | boolean | false |
| Altura da Linha | `AlturaLinha` | integer | 33 |
| Mensagem Quando Vazia | `Placeholder` | text | — |
| Ativar Pesquisa | `AtivarPesquisa` | boolean | true |
| Paginação | `Paginacao` | integer | 0 |
| Seleção de Múltiplas Linhas | `SelecaoMultipla` | boolean | true |
| Acessível Todos Modos | `AcessivelTodosModos` | boolean | false |

#### Valores de Lista

**Alinhamento Sumário** (`AlinhamentoSumario`):

- `left` — A Esquerda
- `center` — Centro
- `right` — A Direita

**Operação** (`Operacao`):

- `sum` — Soma
- `avg` — Média
- `max` — Máximo
- `min` — Mínimo

### Eventos

| Evento | Nome Interno |
|--------|-------------|
| Ao Clicar | `AoClicar` |
| Ao Duplo Clique | `AoDuploClique` |
| Ao Modificar | `AoModificar` |
| Ao Modificar Consulta | `AoModificarConsulta` |
| Antes de Excluir | `AntesDeExcluir` |
| Antes de Alterar | `AntesDeAlterar` |
| Antes de Inserir | `AntesDeInserir` |
| Depois de Excluir | `DepoisDeExcluir` |
| Depois de Alterar | `DepoisDeAlterar` |
| Depois de Inserir | `DepoisDeInserir` |

### Funções

#### Tabela - Obter Linha Selecionada

```
Esta função recebe o nome da tabela e retorna o número da linha que está selecionada na tabela na página atual.

Parâmetro:
1. Nome da Tabela. (Componente)

Retorno:
Número da linha selecionada. (Inteiro)

Observação:
Se não existir nenhuma linha selecionada o retorno será 0.
```

**Parâmetros:**

1. `Nome da Tabela` — Componente

#### Tabela - Obter Linhas Selecionadas

```
Esta função recebe o nome da tabela e retorna uma lista com os números das linhas que estão selecionadas na tabela na página atual.

Parâmetro:
1. Nome da Tabela. (Componente)

Retorno:
Lista de Linhas (Variante)

Observação:
Se não existir nenhuma linha selecionada o retorno será nulo/vazio.
```

**Parâmetros:**

1. `Nome da Tabela` — Componente

#### Tabela - Obter Número da Página

```
Esta função recebe o nome da tabela e retorna o número da página atual na tabela.

Parâmetro:
1. Nome da Tabela. (Componente)

Retorno:
Número da página atual. (Inteiro)

Observação:
Se não existir paginação o retorno será 0.
```

**Parâmetros:**

1. `Nome da Tabela` — Componente

#### Tabela - Exibir Coluna

```
Esta função recebe o nome da tabela, o nome da coluna e um valor lógico para mostrar/ocultar a coluna da tabela.

Parâmetros:
1. Nome da Tabela. (Componente)
2. Nome da Coluna. (Letras)
3. Mostrar (Sim) ou ocultar (Não). (Lógico)

Retorno:
Não possui.
```

**Parâmetros:**

1. `Nome da Tabela` — Componente
2. `Nome da Coluna` — Letras
3. `Mostrar` — Lógico

#### Tabela - Obter Valor

```
Esta função recebe o nome da tabela, o número da linha e o nome da coluna, retornando o valor contido na célula.

Parâmetros:
1. Nome da Tabela. (Componente)
2. Número da Linha. (Inteiro) (Caso o componente esteja em modo de inserção ou edição, essa propriedade será ignorada)
3. Nome da Coluna. (Letras)

Retorno:
Valor da célula. (Letras)

Observação(ões):
1. A linha é da página atual que está sendo visualizada.
2. Caso o componente esteja em modo de inserção/edição será retornado o valor da coluna da linha em inserção/edição.
```

**Parâmetros:**

1. `Nome da Tabela` — Componente
2. `Número da Linha` — Inteiro
3. `Nome da Coluna` — Letras

#### Tabela - Selecionar Linha

```
Esta função recebe o nome da tabela e a linha que será selecionada na tabela.

Parâmetros:
1. Nome da Tabela. (Componente)
2. Número da Linha. (Inteiro)

Retorno:
Não Possui.
```

**Parâmetros:**

1. `Nome da Tabela` — Componente
2. `Número da Linha` — Inteiro

#### Tabela - Recarregar Componente

```
Esta função recebe o nome da tabela e recarrega o componente, voltando para o estado inicial.

Parâmetros:
1. Nome da Tabela. (Componente)

Retorno:
Não Possui.
```

**Parâmetros:**

1. `Nome da Tabela` — Componente

#### Tabela - Criar Dinamicamente

```
[DEPRECIADO]Esta função cria dinamicamente uma Tabela.
       NÃO RECOMENDAMOS A UTILIZAÇÃO DESTA FUNÇÃO, DEVIDO A EXPOSIÇÃO DA CONSULTA SQL PASSADA POR PARÂMETRO.
       UTILIZAR A FUNÇÃO "Tabela - Criar Dinamicamente Servidor".

Parâmetros:
1. Nome
2. Aba
3. Largura
4. Altura
5. Posição X
6. Posição Y
7. Consulta SQL
8. Cabeçalho (Lista de Lista. Ver observação 1)
9. Altura da Linha
10. Agrupamento 
11. Resumo Geral (Agrupamento) 
12. Coluna Sumário (Agrupamento)
13. Texto Resumo (Agrupamento)
14. Auto-Ajuste das Linhas
15. Permitir Pesquisa
16. Seleção de Múltiplas Linhas
17. Paginação
18. Nome da Conexão (Nulo para Conexão Principal)
19. Container

Retorno:
Não possui.

Observação:
1. Cada coluna do cabeçalho será representado por um elemento da lista, cada elemento deverá conter uma lista com as informações: Nome do Campo da Consulta, Nome do Cabeçalho, Tamanho da Coluna e Alinhamento da coluna(Esquerdo = left, Direito = right, Centro = center).
2. A consulta informada no 7º parâmetro deve conter as cláusulas WHERE_NEW ou WHERE_ADD, ORDER_NEW ou ORDER_ADD. Recomenda-se a utilização do Assistente de consulta
para obter estas cláusulas.
```

**Parâmetros:**

1. `Nome` — Letras
2. `Aba` — Letras
3. `Largura` — Inteiro
4. `Altura` — Inteiro
5. `Posição X` — Inteiro
6. `Posição Y` — Inteiro
7. `Consulta SQL` — Letras
8. `Cabeçalho` — Variante
9. `Altura da Linha` — Inteiro
10. `Agrupamento` — Lógico
11. `Resumo Geral` — Letras
12. `Coluna Sumário (Agrupamento)` — Letras
13. `Texto Resumo (Agrupamento)` — Letras
14. `Auto-Ajuste das Linhas` — Lógico
15. `Permitir Pesquisa` — Lógico
16. `Seleção de Múltiplas Linhas` — Lógico
17. `Paginação` — Inteiro
18. `Conexão` — Letras
19. `Container` — Letras

#### Tabela - Criar Dinamicamente Servidor

```
Esta função cria dinamicamente uma Tabela

Parâmetros:
1. Nome
2. Aba
3. Largura
4. Altura
5. Posição X
6. Posição Y
7. Consulta SQL
8. Cabeçalho (Lista de Lista. Ver observação 1)
9. Altura da Linha
10. Agrupamento 
11. Resumo Geral (Agrupamento) 
12. Coluna Sumário (Agrupamento)
13. Texto Resumo (Agrupamento)
14. Auto-Ajuste das Linhas
15. Permitir Pesquisa
16. Seleção de Múltiplas Linhas
17. Paginação
18. Nome da Conexão (Nulo para Conexão Principal)
19. Evento Ao Clicar (Ver observação 3)
20. Evento Ao Duplo Clicar (Ver observação 3)
21. Evento Ao Modificar Consulta (Ver observação 3)
22. Container

Retorno:
Não possui.

Observação:
1. Cada coluna do cabeçalho será representado por um elemento da lista, cada elemento deverá conter uma lista com as informações: Nome do Campo da Consulta, Nome do Cabeçalho, Tamanho da Coluna e Alinhamento da coluna(Esquerdo = left, Direito = right, Centro = center).
2. A consulta informada no 7º parâmetro deve conter as cláusulas WHERE_NEW ou WHERE_ADD, ORDER_NEW ou ORDER_ADD. Recomenda-se a utilização do Assistente de consulta
para obter estas cláusulas.
3. Deverá ser passado uma lista com dois elementos, onde a primeira posição será o nome do fluxo e a segunda uma lista com parâmetros para o fluxo. O evento "Ao Modificar Consulta" é passa como parâmetro automático a consulta realizada.
```

**Parâmetros:**

1. `Nome` — Letras
2. `Aba` — Letras
3. `Largura` — Inteiro
4. `Altura` — Inteiro
5. `Posição X` — Inteiro
6. `Posição Y` — Inteiro
7. `Consulta SQL` — Letras
8. `Cabeçalho` — Variante
9. `Altura da Linha` — Inteiro
10. `Agrupamento` — Lógico
11. `Resumo Geral` — Letras
12. `Coluna Sumário (Agrupamento)` — Letras
13. `Texto Resumo (Agrupamento)` — Letras
14. `Auto-Ajuste das Linhas` — Lógico
15. `Permitir Pesquisa` — Lógico
16. `Seleção de Múltiplas Linhas` — Lógico
17. `Paginação` — Inteiro
18. `Conexão` — Letras
19. `Ao Clicar` — Variante
20. `Ao Duplo Clicar` — Variante
21. `Ao Modificar Consulta` — Variante
22. `Container` — Letras

#### Tabela - Alterar Valor

```
Esta função atualiza o valor de uma coluna quando a tabela estiver em modo de inserção ou edição.

Parâmetros:
1. Nome da Tabela. (Componente)
2. Coluna. (Letras)
3. Valor. (Variante)

Retorno:
Não Possui.
```

**Parâmetros:**

1. `Nome da Tabela` — Componente
2. `Nome da Coluna` — Letras
3. `Valor` — Variante

#### Tabela - Habilitar Coluna

```
Essa função habilita ou desabilita a coluna do componente de acordo o valor lógico passado no terceiro parâmetro.

Parâmetros:
1. Nome da Tabela. (Componente)
2. Nome da Coluna. (Letras)
3. Habilitar? (Lógico)

Retorno:
Não Possui.

Observação:
A coluna só será habilitada/desabilitada se o componente estiver em modo de inserção ou alteração.
```

**Parâmetros:**

1. `Nome da Tabela` — Componente
2. `Nome da Coluna` — Letras
3. `Habilitar?` — Lógico

#### Tabela - Modificar Consulta

```
Esta função modifica a consulta do componente de acordo com o SQL passado no segundo parâmetro.

Parâmetros:
1. Nome da Tabela. (Componente)
2. Consulta SQL. (Letras)

Retorno:
Não Possui.

Observação:
A nova consulta deverá conter a mesma quantidade de campos e mesma tabela da consulta anterior.

Exemplos;
Suponhamos que temos uma Tabela chamada de 'Tabela de Cidades 'com os campos 'Código', 'Nome' e 
'PIB'(produto interno bruto) e que retorna(select) todas as cidades do Brasil, utilizamos a função 
"Tabela - Modificar Consulta" para as cidades que possuem o PIB maior que 100.000 - bastando portanto modificar a consulta,
inserindo a clausula where e a condição maior que 100.000
```

**Parâmetros:**

1. `Nome da Tabela` — Componente
2. `Consulta SQL` — Letras

---

## Timer

- **Categoria:** Adicionais
- **Pasta:** `Components/Timer/`
- **Manual:** https://manual.softwell.com.br/#/timer

### Propriedades

| Propriedade | Nome Interno | Tipo | Valor Padrão |
|------------|-------------|------|-------------|
| Estilo da Fonte | `fonteRelogio` | font | Arial,14,0000,clBlack |
| Formato do Timer | `formatoTimer` |  | HH:mm:ss |
| Mostrar Iniciar | `mostrarIniciar` | boolean | true |
| Mostrar Pausar | `mostrarPausar` | boolean | true |
| Mostrar Parar | `mostrarParar` | boolean | true |
| Mostrar Reiniciar | `mostrarReiniciar` | boolean | true |
| Auto Iniciar | `autoIniciar` | boolean | true |
| Valor Inicial | `valorInicial` | text | 00:00:00 |
| Voltar Para o Início | `voltarValor` | boolean | false |
| Contínuo | `continuo` | boolean | false |
| Tipo | `tipoTimer` | List | P |

#### Valores de Lista

**Tipo** (`tipoTimer`):

- `P` — Progressivo
- `R` — Regressivo

### Eventos

| Evento | Nome Interno |
|--------|-------------|
| Ao Iniciar | `AoIniciar` |
| Ao Parar | `AoParar` |
| Ao Pausar | `AoPausar` |

---

## Upload

- **Categoria:** Adicionais
- **Pasta:** `Components/Upload/`
- **Manual:** https://manual.softwell.com.br/#/upload

### Propriedades

| Propriedade | Nome Interno | Tipo | Valor Padrão |
|------------|-------------|------|-------------|
| Modo de Upload | `ModoDeUpload` | List | multiple |

#### Valores de Lista

**Modo de Upload** (`ModoDeUpload`):

- `single` — Individual
- `multiple` — Múltiplo

### Eventos

| Evento | Nome Interno |
|--------|-------------|
| Ao Anexar | `AoAnexar` |
| Ao Enviar | `AoEnviar` |

---

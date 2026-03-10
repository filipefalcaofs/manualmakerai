# ⚡ Propriedades dos Componentes no Runner

Os arquivos `.list` em `Resources/runner/` definem quais propriedades e eventos cada tipo
de componente expõe no runtime (Webrun). Cada linha segue o formato `NomeInterno=Rótulo Exibido`.

## Resumo

Total: **20 arquivos de definição**

| Arquivo | Componente | Propriedades | Eventos |
|---------|-----------|:-----------:|:------:|
| `component.button.list` | Button | 18 | 1 |
| `component.chart.list` | Chart | 64 | 1 |
| `component.checkbox.list` | Checkbox | 21 | 2 |
| `component.combobox.list` | Combobox | 22 | 4 |
| `component.duallist.list` | Duallist | 33 | 9 |
| `component.edit.list` | Edit | 23 | 5 |
| `component.form.list` | Form | 21 | 10 |
| `component.frame.list` | Frame | 14 | 1 |
| `component.grid.list` | Grid | 27 | 5 |
| `component.image.list` | Image | 24 | 2 |
| `component.label.list` | Label | 19 | 1 |
| `component.list` | List | 19 | 0 |
| `component.lookup.list` | Lookup | 29 | 6 |
| `component.memo.list` | Memo | 23 | 5 |
| `component.radiogroup.list` | Radiogroup | 22 | 2 |
| `component.serie.list` | Serie | 36 | 0 |
| `component.subform.list` | Subform | 16 | 0 |
| `component.system.list` | System | 17 | 5 |
| `component.treeview.list` | Treeview | 24 | 6 |
| `components.list` | Components | 15 | 0 |

---

## Button (`component.button.list`)

### Propriedades

| Nome Interno | Rótulo |
|-------------|--------|
| `Aba` | Aba |
| `Altura` | Altura |
| `Codigo` | Codigo |
| `CodigoForm` | CodigoForm |
| `Descricao` | Descricao |
| `Dica` | Dica |
| `Fonte` | Fonte |
| `Habilitado` | Habilitado |
| `Imagem` | Imagem |
| `Nome` | Nome |
| `Ordem` | Ordem |
| `Parametros` | Parametros |
| `PosicaoX` | PosicaoX |
| `PosicaoY` | PosicaoY |
| `Tabulacao` | Tabulacao |
| `Tabular` | Tabular |
| `Tamanho` | Tamanho |
| `Visivel` | Visivel |

### Eventos

| Nome Interno | Rótulo |
|-------------|--------|
| `AoCLicar` | Ao Clicar |

---

## Chart (`component.chart.list`)

### Propriedades

| Nome Interno | Rótulo |
|-------------|--------|
| `Aba` | Aba |
| `Altura` | Altura |
| `Codigo` | Codigo |
| `Cor` | Cor |
| `CorLegenda` | CorLegenda |
| `Dica` | Dica |
| `DisposicaoLegenda` | DisposicaoLegenda |
| `EixoEsquerdoAutomatico` | EixoEsquerdoAutomatico |
| `EixoEsquerdoAutoMaximo` | EixoEsquerdoAutoMaximo |
| `EixoEsquerdoAutoMinimo` | EixoEsquerdoAutoMinimo |
| `EixoEsquerdoBaseLog` | EixoEsquerdoBaseLog |
| `EixoEsquerdoDeslocMaximo` | EixoEsquerdoDeslocMaximo |
| `EixoEsquerdoDeslocMinimo` | EixoEsquerdoDeslocMinimo |
| `EixoEsquerdoFonte` | EixoEsquerdoFonte |
| `EixoEsquerdoIncremento` | EixoEsquerdoIncremento |
| `EixoEsquerdoInvertido` | EixoEsquerdoInvertido |
| `EixoEsquerdoLogaritmico` | EixoEsquerdoLogaritmico |
| `EixoEsquerdoMaximo` | EixoEsquerdoMaximo |
| `EixoEsquerdoMinimo` | EixoEsquerdoMinimo |
| `EixoEsquerdoMostrarGrade` | EixoEsquerdoMostrarGrade |
| `EixoEsquerdoRotuloAngulo` | EixoEsquerdoRotuloAngulo |
| `EixoEsquerdoRotuloFonte` | EixoEsquerdoRotuloFonte |
| `EixoEsquerdoRotuloFormato` | EixoEsquerdoRotuloFormato |
| `EixoEsquerdoRotuloPosicaoFinal` | EixoEsquerdoRotuloPosicaoFinal |
| `EixoEsquerdoRotuloPosicaoInicial` | EixoEsquerdoRotuloPosicaoInicial |
| `EixoEsquerdoRotuloSeparacao` | EixoEsquerdoRotuloSeparacao |
| `EixoEsquerdoTitulo` | EixoEsquerdoTitulo |
| `EixoEsquerdoVisivel` | EixoEsquerdoVisivel |
| `EixoInferiorAutomatico` | EixoInferiorAutomatico |
| `EixoInferiorAutoMaximo` | EixoInferiorAutoMaximo |
| `EixoInferiorAutoMinimo` | EixoInferiorAutoMinimo |
| `EixoInferiorBaseLog` | EixoInferiorBaseLog |
| `EixoInferiorDeslocMaximo` | EixoInferiorDeslocMaximo |
| `EixoInferiorDeslocMinimo` | EixoInferiorDeslocMinimo |
| `EixoInferiorFonte` | EixoInferiorFonte |
| `EixoInferiorIncremento` | EixoInferiorIncremento |
| `EixoInferiorInvertido` | EixoInferiorInvertido |
| `EixoInferiorLogaritmico` | EixoInferiorLogaritmico |
| `EixoInferiorMaximo` | EixoInferiorMaximo |
| `EixoInferiorMinimo` | EixoInferiorMinimo |
| `EixoInferiorMostrarGrade` | EixoInferiorMostrarGrade |
| `EixoInferiorRotuloAngulo` | EixoInferiorRotuloAngulo |
| `EixoInferiorRotuloFonte` | EixoInferiorRotuloFonte |
| `EixoInferiorRotuloFormato` | EixoInferiorRotuloFormato |
| `EixoInferiorRotuloPosicaoFinal` | EixoInferiorRotuloPosicaoFinal |
| `EixoInferiorRotuloPosicaoInicial` | EixoInferiorRotuloPosicaoInicial |
| `EixoInferiorRotuloSeparacao` | EixoInferiorRotuloSeparacao |
| `EixoInferiorTitulo` | EixoInferiorTitulo |
| `EixoInferiorVisivel` | EixoInferiorVisivel |
| `EixosAtras` | EixosAtras |
| `Elevacao` | Elevacao |
| `EstiloLegenda` | EstiloLegenda |
| `EstiloTextoLegenda` | EstiloTextoLegenda |
| `Mostrar3D` | Mostrar3D |
| `MostrarEixos` | MostrarEixos |
| `MostrarLegenda` | MostrarLegenda |
| `Nome` | Nome |
| `Ordem` | Ordem |
| `Porcentagem3D` | Porcentagem3D |
| `PosicaoX` | PosicaoX |
| `PosicaoY` | PosicaoY |
| `Series` | Series |
| `Tamanho` | Tamanho |
| `Titulo` | Titulo |

### Eventos

| Nome Interno | Rótulo |
|-------------|--------|
| `AoCLicar` | Ao Clicar |

---

## Checkbox (`component.checkbox.list`)

### Propriedades

| Nome Interno | Rótulo |
|-------------|--------|
| `Aba` | Aba |
| `Altura` | Altura |
| `ApenasLeitura` | ApenasLeitura |
| `Campo` | Campo |
| `Codigo` | Codigo |
| `Cor` | Cor |
| `Descricao` | Descricao |
| `Dica` | Dica |
| `Fonte` | Fonte |
| `Habilitado` | Habilitado |
| `Nome` | Nome |
| `Ordem` | Ordem |
| `PosicaoX` | PosicaoX |
| `PosicaoY` | PosicaoY |
| `Tabulacao` | Tabulacao |
| `Tabular` | Tabular |
| `Tamanho` | Tamanho |
| `Tipo` | Tipo |
| `ValorCheck` | ValorCheck |
| `ValorUnCheck` | ValorUnCheck |
| `Visivel` | Visivel |

### Eventos

| Nome Interno | Rótulo |
|-------------|--------|
| `AoCLicar` | Ao Clicar |
| `AoModificar` | Ao Modificar |

---

## Combobox (`component.combobox.list`)

### Propriedades

| Nome Interno | Rótulo |
|-------------|--------|
| `Aba` | Aba |
| `Altura` | Altura |
| `ApenasLeitura` | ApenasLeitura |
| `Atributos` | Atributos |
| `Campo` | Campo |
| `Codigo` | Codigo |
| `Cor` | Cor |
| `Descricao` | Descricao |
| `Dica` | Dica |
| `Fonte` | Fonte |
| `Habilitado` | Habilitado |
| `Lista` | Lista |
| `Nome` | Nome |
| `Ordem` | Ordem |
| `PosicaoX` | PosicaoX |
| `PosicaoY` | PosicaoY |
| `Tabulacao` | Tabulacao |
| `Tabular` | Tabular |
| `Tamanho` | Tamanho |
| `Tipo` | Tipo |
| `Valores` | Valores |
| `Visivel` | Visivel |

### Eventos

| Nome Interno | Rótulo |
|-------------|--------|
| `AoCLicar` | Ao Clicar |
| `AoEntrar` | Ao Entrar |
| `AoModificar` | Ao Modificar |
| `AoSair` | Ao Sair |

---

## Duallist (`component.duallist.list`)

### Propriedades

| Nome Interno | Rótulo |
|-------------|--------|
| `Aba` | Aba |
| `AdicionarItem` | AdicionarItem |
| `AdicionarTodos` | AdicionarTodos |
| `Altura` | Altura |
| `ApenasLeitura` | ApenasLeitura |
| `CampoChavePrincipal` | CampoChavePrincipal |
| `CampoChaveSelecionados` | CampoChaveSelecionados |
| `CampoListaPrincipal` | CampoListaPrincipal |
| `CampoListaSelecionados` | CampoListaSelecionados |
| `Codigo` | Codigo |
| `Cor` | Cor |
| `DescricaoPrincipal` | DescricaoPrincipal |
| `DescricaoSelecionados` | DescricaoSelecionados |
| `Dica` | Dica |
| `DuploClique` | DuploClique |
| `Fonte` | Fonte |
| `FonteDescricaoPrincipal` | FonteDescricaoPrincipal |
| `FonteDescricaoSelecionados` | FonteDescricaoSelecionados |
| `Habilitado` | Habilitado |
| `Nome` | Nome |
| `Ordem` | Ordem |
| `ParametrosPrincipal` | ParametrosPrincipal |
| `ParametrosSelecionados` | ParametrosSelecionados |
| `PosicaoX` | PosicaoX |
| `PosicaoY` | PosicaoY |
| `RemoverItem` | RemoverItem |
| `RemoverTodos` | RemoverTodos |
| `SQLPrincipal` | SQLPrincipal |
| `SQLSelecionados` | SQLSelecionados |
| `Tabulacao` | Tabulacao |
| `Tabular` | Tabular |
| `Tamanho` | Tamanho |
| `Visivel` | Visivel |

### Eventos

| Nome Interno | Rótulo |
|-------------|--------|
| `Antesdeadicionaritem` | Antes de adicionar item |
| `Antesdeadicionartodos` | Antes de adicionar todos |
| `Antesderemoveritem` | Antes de remover item |
| `Antesderemovertodos` | Antes de remover todos |
| `AoDuploClicar` | Ao Duplo Clicar |
| `Depoisdeadicionaritem` | Depois de adicionar item |
| `Depoisdeadicionartodos` | Depois de adicionar todos |
| `Depoisderemoveritem` | Depois de remover item |
| `Depoisderemovertodos` | Depois de remover todos |

---

## Edit (`component.edit.list`)

### Propriedades

| Nome Interno | Rótulo |
|-------------|--------|
| `Aba` | Aba |
| `Altura` | Altura |
| `ApenasLeitura` | ApenasLeitura |
| `Atributos` | Atributos |
| `Campo` | Campo |
| `Codigo` | Codigo |
| `Conteudo` | Conteudo |
| `Cor` | Cor |
| `Descricao` | Descricao |
| `Dica` | Dica |
| `Fonte` | Fonte |
| `Habilitado` | Habilitado |
| `Nome` | Nome |
| `Ordem` | Ordem |
| `PosicaoX` | PosicaoX |
| `PosicaoY` | PosicaoY |
| `Senha` | Senha |
| `Tabulacao` | Tabulacao |
| `Tabular` | Tabular |
| `Tamanho` | Tamanho |
| `TamanhoMaximo` | TamanhoMaximo |
| `Tipo` | Tipo |
| `Visivel` | Visivel |

### Eventos

| Nome Interno | Rótulo |
|-------------|--------|
| `AoCLicar` | Ao Clicar |
| `AoEntrar` | Ao Entrar |
| `AoModificar` | Ao Modificar |
| `AoPressionarTecla` | Ao Pressionar Tecla |
| `AoSair` | Ao Sair |

---

## Form (`component.form.list`)

### Propriedades

| Nome Interno | Rótulo |
|-------------|--------|
| `AbaLocalizar` | AbaLocalizar |
| `Abas` | Abas |
| `Ajuda` | Ajuda |
| `Apresentacao` | Apresentacao |
| `BarraDeRolagem` | BarraDeRolagem |
| `BotaoFechar` | BotaoFechar |
| `BotaoMaximizar` | BotaoMaximizar |
| `BotaoMinimizar` | BotaoMinimizar |
| `CampoVersao` | CampoVersao |
| `Centralizado` | Centralizado |
| `Cor` | Cor |
| `EntrarComoPesquisa` | EntrarComoPesquisa |
| `ExibicaoImagemFundo` | ExibicaoImagemFundo |
| `FonteDeDados` | FonteDeDados |
| `Imagem` | Imagem |
| `MensagemErroChaveEstrangeira` | MensagemErroChaveEstrangeira |
| `MensagemErroChavePrimaria` | MensagemErroChavePrimaria |
| `Modal` | Modal |
| `Navegacao` | Navegacao |
| `UltimaModificacao` | UltimaModificacao |
| `UltimoUsuario` | UltimoUsuario |

### Eventos

| Nome Interno | Rótulo |
|-------------|--------|
| `AntesdeDeletar` | Antes de Deletar |
| `AntesdeGravar` | Antes de Gravar |
| `AntesdeInserir` | Antes de Inserir |
| `AoEntrar` | Ao Entrar |
| `AoNavegar` | Ao Navegar |
| `AoPressionarTecla` | Ao Pressionar Tecla |
| `AoSair` | Ao Sair |
| `DepoisdeDeletar` | Depois de Deletar |
| `DepoisdeGravar` | Depois de Gravar |
| `DepoisdeGravar` | Depois de Inserir |

---

## Frame (`component.frame.list`)

### Propriedades

| Nome Interno | Rótulo |
|-------------|--------|
| `Aba` | Aba |
| `Altura` | Altura |
| `Codigo` | Codigo |
| `ConsiderarOrdem` | ConsiderarOrdem |
| `Cor` | Cor |
| `Dica` | Dica |
| `Estilo` | Estilo |
| `Forma` | Forma |
| `Nome` | Nome |
| `Ordem` | Ordem |
| `PosicaoX` | PosicaoX |
| `PosicaoY` | PosicaoY |
| `Tamanho` | Tamanho |
| `Visivel` | Visivel |

### Eventos

| Nome Interno | Rótulo |
|-------------|--------|
| `AoCLicar` | Ao Clicar |

---

## Grid (`component.grid.list`)

### Propriedades

| Nome Interno | Rótulo |
|-------------|--------|
| `Aba` | Aba |
| `Altura` | Altura |
| `ApenasLeitura` | ApenasLeitura |
| `Atributos` | Atributos |
| `ChamaSubForm` | ChamaSubForm |
| `Codigo` | Codigo |
| `CodigoForm` | CodigoForm |
| `Colunas` | Colunas |
| `Cor` | Cor |
| `CorCondicional` | CorCondicional |
| `Descricao` | Descricao |
| `Dica` | Dica |
| `Editavel` | Editavel |
| `Fonte` | Fonte |
| `GridPai` | GridPai |
| `Habilitado` | Habilitado |
| `Nome` | Nome |
| `Ordem` | Ordem |
| `Paginacao` | Paginacao |
| `Parametros` | Parametros |
| `PosicaoX` | PosicaoX |
| `PosicaoY` | PosicaoY |
| `Tabulacao` | Tabulacao |
| `Tabular` | Tabular |
| `Tamanho` | Tamanho |
| `Tipo` | Tipo |
| `Visivel` | Visivel |

### Eventos

| Nome Interno | Rótulo |
|-------------|--------|
| `AoCLicar` | Ao Clicar |
| `AoDuploClicar` | Ao Duplo Clicar |
| `AoEntrar` | Ao Entrar |
| `AoModificar` | Ao Modificar |
| `AoSair` | Ao Sair |

---

## Image (`component.image.list`)

### Propriedades

| Nome Interno | Rótulo |
|-------------|--------|
| `Aba` | Aba |
| `Altura` | Altura |
| `AlturaZoom` | AlturaZoom |
| `ApenasLeitura` | ApenasLeitura |
| `Campo` | Campo |
| `CampoCodImpDigital` | CampoCodImpDigital |
| `Codigo` | Codigo |
| `Descricao` | Descricao |
| `Dica` | Dica |
| `Exibicao` | Exibicao |
| `GravarEmArquivo` | GravarEmArquivo |
| `Habilitado` | Habilitado |
| `Imagem` | Imagem |
| `LarguraZoom` | LarguraZoom |
| `Nome` | Nome |
| `Ordem` | Ordem |
| `PosicaoX` | PosicaoX |
| `PosicaoY` | PosicaoY |
| `Tabulacao` | Tabulacao |
| `Tabular` | Tabular |
| `Tamanho` | Tamanho |
| `TipoExibicao` | TipoExibicao |
| `URL` | URL |
| `Visivel` | Visivel |

### Eventos

| Nome Interno | Rótulo |
|-------------|--------|
| `AoCLicar` | Ao Clicar |
| `AoModificar` | Ao Modificar |

---

## Label (`component.label.list`)

### Propriedades

| Nome Interno | Rótulo |
|-------------|--------|
| `Aba` | Aba |
| `Altura` | Altura |
| `Campo` | Campo |
| `Codigo` | Codigo |
| `Cor` | Cor |
| `Descricao` | Descricao |
| `Dica` | Dica |
| `Fonte` | Fonte |
| `Habilitado` | Habilitado |
| `HorzAlignment` | HorzAlignment |
| `Nome` | Nome |
| `Ordem` | Ordem |
| `PosicaoX` | PosicaoX |
| `PosicaoY` | PosicaoY |
| `QuebraAutomaticaDeLinha` | QuebraAutomaticaDeLinha |
| `Tamanho` | Tamanho |
| `TamanhoAutomatico` | TamanhoAutomatico |
| `VertAlignment` | VertAlignment |
| `Visivel` | Visivel |

### Eventos

| Nome Interno | Rótulo |
|-------------|--------|
| `AoCLicar` | Ao Clicar |

---

## List (`component.list`)

### Propriedades

| Nome Interno | Rótulo |
|-------------|--------|
| `Aba` | Aba |
| `Altura` | Altura |
| `Campo` | Campo |
| `Codigo` | Codigo |
| `Cor` | Cor |
| `Descricao` | Descricao |
| `Dica` | Dica |
| `Fonte` | Fonte |
| `Habilitado` | Habilitado |
| `HorzAlignment` | HorzAlignment |
| `Nome` | Nome |
| `Ordem` | Ordem |
| `PosicaoX` | PosicaoX |
| `PosicaoY` | PosicaoY |
| `QuebraAutomaticaDeLinha` | QuebraAutomaticaDeLinha |
| `Tamanho` | Tamanho |
| `TamanhoAutomatico` | TamanhoAutomatico |
| `VertAlignment` | VertAlignment |
| `Visivel` | Visivel |

---

## Lookup (`component.lookup.list`)

### Propriedades

| Nome Interno | Rótulo |
|-------------|--------|
| `Aba` | Aba |
| `Altura` | Altura |
| `ApenasLeitura` | ApenasLeitura |
| `Atributos` | Atributos |
| `Campo` | Campo |
| `CampoChave` | CampoChave |
| `CampoLista` | CampoLista |
| `ChamaSubForm` | ChamaSubForm |
| `Codigo` | Codigo |
| `CodigoForm` | CodigoForm |
| `Cor` | Cor |
| `Descricao` | Descricao |
| `Dica` | Dica |
| `Estilo` | Estilo |
| `Fonte` | Fonte |
| `FonteDeDados` | FonteDeDados |
| `Habilitado` | Habilitado |
| `Mascara` | Mascara |
| `Nome` | Nome |
| `Ordem` | Ordem |
| `Paginacao` | Paginacao |
| `PosicaoX` | PosicaoX |
| `PosicaoY` | PosicaoY |
| `SQL` | SQL |
| `Tabulacao` | Tabulacao |
| `Tabular` | Tabular |
| `Tamanho` | Tamanho |
| `Tipo` | Tipo |
| `Visivel` | Visivel |

### Eventos

| Nome Interno | Rótulo |
|-------------|--------|
| `AoCLicar` | Ao Clicar |
| `AoEntrar` | Ao Entrar |
| `AoModificar` | Ao Modificar |
| `AoPreencherLista` | Ao Preencher Lista |
| `AoPressionarTecla` | Ao Pressionar Tecla |
| `AoSair` | Ao Sair |

---

## Memo (`component.memo.list`)

### Propriedades

| Nome Interno | Rótulo |
|-------------|--------|
| `Aba` | Aba |
| `Altura` | Altura |
| `ApenasLeitura` | ApenasLeitura |
| `Atributos` | Atributos |
| `Campo` | Campo |
| `Codigo` | Codigo |
| `Cor` | Cor |
| `Descricao` | Descricao |
| `Dica` | Dica |
| `Fonte` | Fonte |
| `Habilitado` | Habilitado |
| `Nome` | Nome |
| `Ordem` | Ordem |
| `PosicaoX` | PosicaoX |
| `PosicaoY` | PosicaoY |
| `QuebraAutomaticaDeLinha` | QuebraAutomaticaDeLinha |
| `Tabulacao` | Tabulacao |
| `Tabular` | Tabular |
| `Tamanho` | Tamanho |
| `TamanhoMaximo` | TamanhoMaximo |
| `TextoRico` | TextoRico |
| `Tipo` | Tipo |
| `Visivel` | Visivel |

### Eventos

| Nome Interno | Rótulo |
|-------------|--------|
| `AoCLicar` | Ao Clicar |
| `AoEntrar` | Ao Entrar |
| `AoModificar` | Ao Modificar |
| `AoPressionarTecla` | Ao Pressionar Tecla |
| `AoSair` | Ao Sair |

---

## Radiogroup (`component.radiogroup.list`)

### Propriedades

| Nome Interno | Rótulo |
|-------------|--------|
| `Aba` | Aba |
| `Altura` | Altura |
| `ApenasLeitura` | ApenasLeitura |
| `Campo` | Campo |
| `Codigo` | Codigo |
| `Cor` | Cor |
| `Descricao` | Descricao |
| `Dica` | Dica |
| `Fonte` | Fonte |
| `Habilitado` | Habilitado |
| `Lista` | Lista |
| `Nome` | Nome |
| `Ordem` | Ordem |
| `PosicaoX` | PosicaoX |
| `PosicaoY` | PosicaoY |
| `QtdeColunas` | QtdeColunas |
| `Tabulacao` | Tabulacao |
| `Tabular` | Tabular |
| `Tamanho` | Tamanho |
| `Tipo` | Tipo |
| `Valores` | Valores |
| `Visivel` | Visivel |

### Eventos

| Nome Interno | Rótulo |
|-------------|--------|
| `AoCLicar` | Ao Clicar |
| `AoModificar` | Ao Modificar |

---

## Serie (`component.serie.list`)

### Propriedades

| Nome Interno | Rótulo |
|-------------|--------|
| `AparecerEmLegenda` | AparecerEmLegenda |
| `CampoDataFim` | CampoDataFim |
| `CampoDataInicio` | CampoDataInicio |
| `CampoEtiqueta` | CampoEtiqueta |
| `CampoProximaTarefa` | CampoProximaTarefa |
| `CampoTarefa` | CampoTarefa |
| `CampoValor` | CampoValor |
| `CampoValorRaio` | CampoValorRaio |
| `CampoValorY` | CampoValorY |
| `Circular` | Circular |
| `Codigo` | Codigo |
| `ConteudoMarcas` | ConteudoMarcas |
| `Cor` | Cor |
| `CorParaCada` | CorParaCada |
| `Degrau` | Degrau |
| `Disposicao` | Disposicao |
| `DistanciaMaiorFatia` | DistanciaMaiorFatia |
| `EmpilhaGrupo` | EmpilhaGrupo |
| `EstiloBolha` | EstiloBolha |
| `InflarMargens` | InflarMargens |
| `LinhaEspessura` | LinhaEspessura |
| `Mostrar3DBolha` | Mostrar3DBolha |
| `Mostrar3DEscuroBolha` | Mostrar3DEscuroBolha |
| `MostrarMarcas` | MostrarMarcas |
| `Nome` | Nome |
| `NomeFluxo` | NomeFluxo |
| `NomeGrafico` | NomeGrafico |
| `Origem` | Origem |
| `OrigemDados` | OrigemDados |
| `SQL` | SQL |
| `TipoGrafico` | TipoGrafico |
| `TipoPlotagem` | TipoPlotagem |
| `Titulo` | Titulo |
| `Transparencia` | Transparencia |
| `UsarOrigem` | UsarOrigem |
| `Visivel` | Visivel |

---

## Subform (`component.subform.list`)

### Propriedades

| Nome Interno | Rótulo |
|-------------|--------|
| `Aba` | Aba |
| `Altura` | Altura |
| `Codigo` | Codigo |
| `CodigoForm` | CodigoForm |
| `Descricao` | Descricao |
| `ExcluirSeInvisivel` | ExcluirSeInvisivel |
| `Habilitado` | Habilitado |
| `Nome` | Nome |
| `Ordem` | Ordem |
| `Parametros` | Parametros |
| `PosicaoX` | PosicaoX |
| `PosicaoY` | PosicaoY |
| `Tabulacao` | Tabulacao |
| `Tabular` | Tabular |
| `Tamanho` | Tamanho |
| `Visivel` | Visivel |

---

## System (`component.system.list`)

### Propriedades

| Nome Interno | Rótulo |
|-------------|--------|
| `Avancado` | Avancado |
| `CodigoForm` | CodigoForm |
| `CurrentAPIVersion` | CurrentAPIVersion |
| `ExibicaoImagemFundo` | ExibicaoImagemFundo |
| `FluxosExternos` | FluxosExternos |
| `FluxosWeb` | FluxosWeb |
| `FormularioDoSerial` | FormularioDoSerial |
| `FormulariosExternos` | FormulariosExternos |
| `IdiomaBase` | IdiomaBase |
| `Idiomas` | Idiomas |
| `RelatoriosExternos` | RelatoriosExternos |
| `RequerAutenticacao` | RequerAutenticacao |
| `Skin` | Skin |
| `VersaoMenu` | VersaoMenu |
| `WebServices` | WebServices |
| `ImagemPrincipal` | ImagemPrincipal |
| `FormularioPrincipal` | FormularioPrincipal |

### Eventos

| Nome Interno | Rótulo |
|-------------|--------|
| `AoAutenticar` | Ao Autenticar |
| `AoEntrar` | Ao Entrar |
| `AoMudarSenha` | Ao Mudar Senha |
| `AoSair` | Ao Sair |
| `AoVerificarSerial` | Ao Verificar Serial |

---

## Treeview (`component.treeview.list`)

### Propriedades

| Nome Interno | Rótulo |
|-------------|--------|
| `Aba` | Aba |
| `Altura` | Altura |
| `Borda` | Borda |
| `CampoChave` | CampoChave |
| `CampoIcone` | CampoIcone |
| `CampoLista` | CampoLista |
| `CampoPai` | CampoPai |
| `CargaPostergada` | CargaPostergada |
| `Codigo` | Codigo |
| `Cor` | Cor |
| `Descricao` | Descricao |
| `Dica` | Dica |
| `Fonte` | Fonte |
| `Habilitado` | Habilitado |
| `Nome` | Nome |
| `Ordem` | Ordem |
| `Parametros` | Parametros |
| `PosicaoX` | PosicaoX |
| `PosicaoY` | PosicaoY |
| `SQL` | SQL |
| `Tabulacao` | Tabulacao |
| `Tabular` | Tabular |
| `Tamanho` | Tamanho |
| `Visivel` | Visivel |

### Eventos

| Nome Interno | Rótulo |
|-------------|--------|
| `AntesdeContrair` | Antes de Contrair |
| `AntesdeExpandir` | Antes de Expandir |
| `AoCLicar` | Ao Clicar |
| `AoDuploClicar` | Ao Duplo Clicar |
| `DepoisdeContrair` | Depois de Contrair |
| `DepoisdeExpandir` | Depois de Expandir |

---

## Components (`components.list`)

### Propriedades

| Nome Interno | Rótulo |
|-------------|--------|
| `TfrmEditor` | form |
| `TMakerEdit` | edit |
| `TMakerButton` | button |
| `TMakerComboBox` | combobox |
| `TMakerMemo` | memo |
| `TMakerLookup` | lookup |
| `TMakerGrid` | grid |
| `TMakerRadioGroup` | radiogroup |
| `TMakerCheckBox` | checkbox |
| `TMakerApplication` | system |
| `TMakerChart` | chart |
| `TMakerDualList` | duallist |
| `TMakerBevel` | frame |
| `TMakerImage` | image |
| `TMakerLabel` | label |

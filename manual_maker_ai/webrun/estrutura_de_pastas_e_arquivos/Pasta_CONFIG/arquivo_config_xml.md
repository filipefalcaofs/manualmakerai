# Arquivo CONFIG.XML

> Fonte: https://manual.softwell.com.br/docs/webrun/estrutura_de_pastas_e_arquivos/Pasta_CONFIG/arquivo_config_xml

# Arquivo CONFIG.XML

Este arquivo registra as configurações definidas na tela Parâmetros de Configuração.

Já que o seu conteúdo é relativo às configurações que o usuário definir, temos, como padrão, grupos de parâmetros, como é exibido abaixo:

- Configuração do Agendador de tarefas - configuração do tempo de execução

```prism-code
<group>  
    <group-name>Agendador</group-name>  
    <item>  
        <item-name>Tempo</item-name>  
        <item-param>600000</item-param>  
    </item>  
</group>
```

- Configuração dos componentes de formulário

```prism-code
<group>  
    <group-name>Componentes</group-name>  
    <item>  
        <item-name>CarregarMoreLookup</item-name>  
        <item-param>1</item-param>  
    </item>  
    <item>  
        <item-name>PaginacaoConsulta</item-name>  
        <item-param>100</item-param>  
    </item>  
    <item>  
        <item-name>PaginacaoGrid</item-name>  
        <item-param>100</item-param>  
    </item>  
    <item>  
        <item-name>PaginacaoMoreLookup</item-name>  
        <item-param>100</item-param>  
    </item>  
</group>
```

- Configuração de ações a executar na chamada do Webrun

```prism-code
<group>  
    <group-name>Inicializacao</group-name>  
    <item>  
        <item-name>oracle.jdbc.V8Compatible</item-name>  
        <item-param>true</item-param>  
    </item>  
</group>
```

- Configuração do Proxy

```prism-code
<group>  
    <group-name>Proxy</group-name>  
    <item>  
        <item-name>Porta</item-name>  
        <item-param>3128</item-param>  
    </item>  
    <item>  
        <item-name>Senha</item-name>  
        <item-param>123abc</item-param>  
    </item>  
    <item>  
        <item-name>Servidor</item-name>  
        <item-param>192.168.1.1</item-param>  
    </item>  
    <item>  
        <item-name>Usuario</item-name>  
        <item-param>jaime</item-param>  
    </item>  
</group>
```

- Configuração do Gerador de Relatório

```prism-code
<group>  
    <group-name>Relatorio</group-name>  
    <item>  
        <item-name>GeradorLocalPadrao</item-name>  
        <item-param>0</item-param>  
    </item>  
</group>
```

- Configuraçõs de Sessão

```prism-code
<group>  
    <group-name>Sessao</group-name>  
    <item>  
        <item-name>DebugCachedFiles</item-name>  
        <item-param>0</item-param>  
    </item>  
    <item>  
        <item-name>DebugMode</item-name>  
        <item-param>0</item-param>  
    </item>  
    <item>  
        <item-name>RuleTimeout</item-name>  
        <item-param>300</item-param>  
    </item>  
    <item>  
        <item-name>Tempo</item-name>  
        <item-param>36000</item-param>  
    </item>  
</group>
```

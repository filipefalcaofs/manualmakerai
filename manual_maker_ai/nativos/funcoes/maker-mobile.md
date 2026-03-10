# Funções Nativas - Maker Mobile

Total: **49** funções

[← Voltar para Funções Nativas](README.md)

---

## Abrir Aplicativo

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfOpenApp` |
| **Código** | 693 |
| **Assinatura** | `Abrir Aplicativo (Letras;Letras)` |
| **Parâmetros** | Letras;Letras |
| **Tipo** | 31 |
| **Compatibilidade** | Cliente |

### Descrição

Função para abrir aplicativo.

Parâmetro(s):
1. Nome do pacote da aplicação. (Letras)
2. Caminho da Activity inicial da aplicação. (Letras)

Retorno:
Não possui.

Observações:
1. As aplicações desenvolvidas no Maker Mobile, possuem o padrão para o nome do pacote, ex: "com.<sigla da aplicação>".
2. As aplicações desenvolvidas no Maker Mobile, possuem o padrão para o caminho da activity, ex: "com.runner.app".
3. Para utilização na plataforma iOS, deve ser informado apenas o primeiro parâmetro. As aplicações iOS desenvolvidas no Maker Mobile possuem um padrão, ex: "AppTeste" nome da aplicação sem espaço.

---

## Aplicação Está em Segundo Plano?

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfAppIsInBackground` |
| **Código** | 860 |
| **Assinatura** | `Aplicação Está em Segundo Plano? (): Lógico` |
| **Retorno** | Lógico |
| **Tipo** | 31 |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Essa função verifica se o aplicativo está em segundo plano.

Parâmetro:
Não possui.

Retorno:
Valor Lógico.

Observação:
Caso verdadeiro, a aplicação está em segundo plano, caso falso, a aplicação está em execução.

### Código Cliente (JavaScript)

```javascript
function stoneSDKCreateTransaction(){
 alert('Função disponível apenas no MakerMobile');
}
```

---

## Associar Evento ao Ativar a Aplicação

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfSetFlowOnBecomeActive` |
| **Código** | 861 |
| **Assinatura** | `Associar Evento ao Ativar a Aplicação (Fluxo)` |
| **Parâmetros** | Fluxo |
| **Tipo** | 31 |
| **Compatibilidade** | Cliente |

### Descrição

Essa função associa um fluxo que será executando quando a aplicação for ativada.
Desta forma, toda vez que aplicação se tornar "Ativa", ou seja, ir para background e voltar, o fluxo será executado.

Parâmetro:
1. Nome do fluxo. (Fluxo)

Retorno:
Não possui.

### Código Cliente (JavaScript)

```javascript
function ebfSetFlowOnBecomeActive(flow){}
```

---

## Associar Evento ao Botão Voltar

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfSetOnBackPress` |
| **Código** | 848 |
| **Assinatura** | `Associar Evento ao Botão Voltar (Fluxo;Variante)` |
| **Parâmetros** | Fluxo;Variante |
| **Tipo** | 31 |
| **Compatibilidade** | Mobile |

### Descrição

Associa um fluxo ao evento do botão Voltar do Android.

Parâmetro(s):
1. Fluxo para a função. (Fluxo)
2. Parâmetros do fluxo (Lista). (Variante)

Retorno:
Não possui.

### Código Cliente (JavaScript)

```javascript
function ebfSetOnBackPress(){
  alert("Função disponível apenas no Maker Mobile!");
}
```

---

## Associar Evento ao Receber Push

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfSetFlowOnPushMessage` |
| **Código** | 748 |
| **Assinatura** | `Associar Evento ao Receber Push (Fluxo;Variante)` |
| **Parâmetros** | Fluxo;Variante |
| **Tipo** | 31 |
| **Compatibilidade** | Cliente |

### Descrição

Essa função associa um fluxo ao evento de recebimento de Push Notification (iOS e Android).
Desta forma, toda vez que uma notificação Push for recebida, o fluxo associado será executado.

Parâmetro(s):
1. Nome do fluxo.
2. Lista de Parâmetros. (Variante, Opcional)

Retorno:
Não possui.

Observação: 
O 1º Parâmetro do fluxo deverá ser reservado para a mensagem que será enviada automaticamente.

### Código Cliente (JavaScript)

```javascript
function ebfebfSetFlowOnPushMessage(flow, params){}
```

---

## Ativar GPS

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfEnableGPS` |
| **Código** | 769 |
| **Assinatura** | `Ativar GPS (): Lógico` |
| **Retorno** | Lógico |
| **Tipo** | 31 |
| **Compatibilidade** | Cliente |

### Descrição

Essa função habilita ou desabilita o GPS do dispositivo.

Parâmetro:
Não possui.

Retorno:
Verdadeiro, caso seja ativado. Falso, caso contrário. (Lógico)

### Código Cliente (JavaScript)

```javascript
function ebfEnableGPS(){}
```

---

## Autenticar com Biometria

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfFingerprintValidation` |
| **Código** | 820 |
| **Assinatura** | `Autenticar com Biometria (Fluxo;Variante;Fluxo;Variante)` |
| **Parâmetros** | Fluxo;Variante;Fluxo;Variante |
| **Tipo** | 31 |
| **Compatibilidade** | Cliente |

### Descrição

Essa função realiza a autenticação do usuário utilizando o leitor biométrico do aparelho celular.

Parâmetro(s):
1. Fluxo de sucesso que será executado.
2. Parâmetros do fluxo de sucesso. (Variante)
3. Fluxo de erro que será executado.
4. Parâmetros do fluxo de erro. (Variante)

Retorno:
Não possui.

Observações: 
1. Será considerado erro e será executado o fluxo de erro caso o aparelho celular não possua leitor biométrico ou não haja pelo menos uma digital cadastrada no sistema operacional.
2. Em aparelhos que utilizam o sistema operacional IOS após várias tentativas de validação biométricas falhas irá ser exigido a senha de letras para validação.
3. Em aparelhos que utilizam o sistema operacional Android após varias tentativas falhas a validação biométrica ficará bloqueada por 90 segundos.

---

## Autenticar com SMS

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfAuthSMS` |
| **Código** | 818 |
| **Assinatura** | `Autenticar com SMS (Letras;Fluxo;Variante;Fluxo;Variante)` |
| **Parâmetros** | Letras;Fluxo;Variante;Fluxo;Variante |
| **Tipo** | 31 |
| **Compatibilidade** | Cliente |

### Descrição

Envia uma mensagem para o servidor Firebase solicitando um código de validação. A mensagem com o código será enviada para o número informado no primeiro parâmetro.
Uma caixa/input será criada para que o usuário informe o código. Caso esteja correto, será executado o fluxo de sucesso, caso contrário, o fluxo de erro será executado.

Parâmetro(s):
1. Número de Telefone. 
2. Fluxo que será executado caso a operação seja realizado com sucesso.
3. Parâmetros adicionais do fluxo de sucesso. (Variante)
4. Fluxo que será executado caso haja algum erro durante a operação. 
5. Parâmetros adicionais do fluxo de erro. (Variante)

Retorno: 
Não possui.

Observações:
1. Antes de utilizar essa função, é necessário configurar o projeto no Firebase  conforme instruções nos links:
"https://manual.softwell.com.br/#/autenticacao_via_sms?id=autenticando-via-sms-com-o-firebase",
"https://manual.softwell.com.br/#/arquivo_firebase".
2. O 1° parâmetro deve estar no formato: + CÓDIGO DO PAÍS + DDD + Nº do Telefone. Exemplo: +557121083800.

### Código Cliente (JavaScript)

```javascript
function ebfAuthSMS(phone, onSuccess, onSuccessParams, onFail, onFailParams){
  console.log("Disponível apenas no MakerMobile");
}
```

---

## Cartão de Crédito - Obter Dados

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfScanCard` |
| **Código** | 825 |
| **Assinatura** | `Cartão de Crédito - Obter Dados (Fluxo;Variante;Fluxo;Variante)` |
| **Parâmetros** | Fluxo;Variante;Fluxo;Variante |
| **Tipo** | 31 |
| **Compatibilidade** | Cliente |

### Descrição

Essa função escaneia o número do cartão de crédito e retorna todos dados do cartão de crédito.

Parâmetro(s):
1. Fluxo de sucesso. (Fluxo)
2. Lista de parâmetros adicionais para o fluxo de sucesso. (Variante)
3. Fluxo de erro. (Fluxo)
4. Lista de parâmetros adicionais para o fluxo de erro. (Variante)

Retorno:
Não possui.

Observação:
O fluxo passado no primeiro parâmetro receberá como primeiro parâmetro um JSON com as seguintes chaves:
    "number": Número completo do cartão (Ex: 1234567812345678);
    "numberMask": Número do cartão formatado, mostrando apenas os quatro últimos dígitos (Ex: ???? ???? ???? 5678);
    "name": Nome descrito no cartão (Ex: Laura M Farias);
    "expiryDate": Data de expiração do cartão em mês/ano (Ex: 01/28);
    "cvv": Código verificador do cartão (Ex: 123).

---

## Chamar Serviço Web HTTPS para Dispositivos Móveis

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfConsumeWsSsl` |
| **Código** | 612 |
| **Assinatura** | `Chamar Serviço Web HTTPS para Dispositivos Móveis (Letras;Variante;Letras)` |
| **Parâmetros** | Letras;Variante;Letras |
| **Tipo** | 31 |
| **Compatibilidade** | Cliente |

### Descrição

Chama um Webservice (são componentes que permitem às aplicações enviar e receber dados em formato XML) para aplicações em dispositivos móveis.

Parâmetro(s):
1. URL do Web Service (Possibilita conexão com https). (Letras)
2. Parâmetro de entrada do Web Service. (Variante)
3. Tipo de Conteúdo (Padrão: JSON). (Letras)

Retorno: 
Retorno do Webservice. (Letras)

### Código Cliente (JavaScript)

```javascript
function ebfConsumeWsSsl(urlPost, postData, contentType){

}
```

---

## Criar notificação na barra de status

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfCreateNotification` |
| **Código** | 823 |
| **Assinatura** | `Criar notificação na barra de status (Fluxo;Variante;Letras;Letras;Lógico;Lógico;Inteiro)` |
| **Parâmetros** | Fluxo;Variante;Letras;Letras;Lógico;Lógico;Inteiro |
| **Tipo** | 31 |
| **Compatibilidade** | Cliente |

### Descrição

Essa função cria uma notificação na barra de status.

Parâmetro(s):
1. Fluxo para executar ao clicar na notificação. (Opcional)
2. Lista de parâmetros para a função. (Variante, Opcional)
3. Titulo da notificação. (Letras)
4. Texto da notificação. (Letras)
5. Auto-cancelar ao clicar? (Lógico)
6. Contínuo? (Lógico)
7. ID da notificação. (Inteiro)

Retorno:
Não possui.

Observações:
1. O fluxo definido no primeiro parâmetro será executado sem pai.
2. Os parâmetros 5, 6 e 7 não possuem funcionalidade na plataforma iOS.
3. O ícone da notificação será o ícone definido para a aplicação.

---

## Criar/Atualizar Shared Preferences

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfCreateSharedPreferences` |
| **Código** | 853 |
| **Assinatura** | `Criar/Atualizar Shared Preferences (Letras;Letras)` |
| **Parâmetros** | Letras;Letras |
| **Tipo** | 31 |
| **Compatibilidade** | Mobile |

### Descrição

Essa função cria um Shared preferences.  Shared Preferences é um recurso disponível no aplicativo que permite gravar valores sem necessidade de criar uma tabela SQL.
Os dados são armazenados apenas no contexto do aplicativo e acessível apenas pelo próprio aplicativo. Os dados serão removidos ao desinstalar o aplicativo ou através da função Limpar Shared Preferences.

Parâmetro(s):
1. Nome da preferences que será criada/atualizada. (Letras)
2. Valor que será adicionado (No iOS, apenas "Letras" são armazenadas). (Letras)

Retorno:
Não possui.

---

## Definir fluxo ao conectar com a Internet

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfSetRuleOnConnect` |
| **Código** | 862 |
| **Assinatura** | `Definir fluxo ao conectar com a Internet (Fluxo;Variante)` |
| **Parâmetros** | Fluxo;Variante |
| **Tipo** | 31 |
| **Compatibilidade** | Cliente |

### Descrição

Esta função define um fluxo para ser executado quando o dispositivo conectar com a Internet.

Parâmetro(s):
1. Fluxo a ser executado. (Fluxo)
2. Parâmetros da regra (Lista). (Variante)

Retorno:
Não possui.

Observação:
O fluxo definido será executado sem pai.

### Código Cliente (JavaScript)

```javascript
function ebfSetRuleOnConnect(){
}
```

---

## Definir fluxo ao perder conexão com a Internet

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfSetRuleOnDisconnect` |
| **Código** | 863 |
| **Assinatura** | `Definir fluxo ao perder conexão com a Internet (Fluxo;Variante)` |
| **Parâmetros** | Fluxo;Variante |
| **Tipo** | 31 |
| **Compatibilidade** | Cliente |

### Descrição

Esta função define um fluxo para ser executado quando o dispositivo perder a conexão com a Internet.

Parâmetro(s):
1. Fluxo a ser executado. (Fluxo)
2. Parâmetros da regra (Lista). (Variante)

Retorno:
Não possui.

Observação:
O fluxo definido será executado sem pai.

### Código Cliente (JavaScript)

```javascript
function ebfSetRuleOnDisconnect(){
}
```

---

## Escolher arquivo no dispositivo

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfDirExplorer` |
| **Código** | 956 |
| **Assinatura** | `Escolher arquivo no dispositivo (Fluxo;Variante;Fluxo;Variante;Lógico)` |
| **Parâmetros** | Fluxo;Variante;Fluxo;Variante;Lógico |
| **Tipo** | 31 |
| **Compatibilidade** | Mobile |

### Descrição

Essa função abre o explorador de arquivos do dispositivo permitindo que o usuário navegue através dos diretórios e
selecione um ou mais arquivos.
Essa seleção é útil para envio de arquivos para o servidor (retaguarda) através da função Enviar arquivos via Post ou
Enviar Arquivo via Post Assíncrono.

Parâmetro(s):
1. Fluxo de Sucesso. 
2. Lista de parâmetros adicionais. (Variante, Opcional) 
3. Fluxo de Erro.
4. Lista de parâmetros adicionais. (Variante, Opcional)
5. Seleção Múltipla? (Lógico) 

Observações:
1. Caso seja informado, reservar o 1º parâmetro. 
2. No 5º Parâmetro para iOS a partir da versão 11. No Android a partir versão 4.4.
3. Caso seja informação Seleção Múltipla, o fluxo de sucesso receberá uma lista contendo um ou mais arquivos selecionados.

---

## Firebase - Autenticação Email

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfEmailLogin` |
| **Código** | 868 |
| **Assinatura** | `Firebase - Autenticação Email (Letras;Letras;Fluxo;Variante;Fluxo;Variante)` |
| **Parâmetros** | Letras;Letras;Fluxo;Variante;Fluxo;Variante |
| **Tipo** | 31 |
| **Compatibilidade** | Cliente |

### Descrição

Essa função realiza o login do usuário na aplicação através do e-mail e senha do usuário passados por parâmetro, caso o e-mail não estiver cadastrado será criada uma nova conta para esse usuário com o e-mail e senha passados e o login será realizado.

Parâmetro(s):
1. E-mail do usuário. (Letras)
2. Senha do usuário. (Letras)
3. Fluxo de sucesso. (Fluxo)
4. Parâmetros de sucesso. (Variante)
5. Fluxo de Erro. (Fluxo)
6. Parâmetros de Erro. (Variante)

Observações:
1. É necessário realizar as configurações no Firebase.
2. Endereço do console do Firebase: "https://console.firebase.google.com/".
3. O arquivo de configuração deverá ser upado no servidor do Maker Mobile através da opção "Configurações Adicionais" disponível na tela de exportação do projeto.
4. A  leitura do arquivo "google-services.json" (Android) ou "google-services.plist" (iOS) será realizada de forma automática.

---

## Firebase - Autenticação Personalizada

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfFirebaseTokenLogin` |
| **Código** | 869 |
| **Assinatura** | `Firebase - Autenticação Personalizada (Letras;Fluxo;Variante;Fluxo;Variante)` |
| **Parâmetros** | Letras;Fluxo;Variante;Fluxo;Variante |
| **Tipo** | 31 |
| **Compatibilidade** | Cliente |

### Descrição

Essa função realiza o login do usuário no Firebase através de um Token personalizado enviado pela retaguarda.

Parâmetro(s):
1. Token personalizado (gerado através do SDK Admin/Retaguarda). (Letras)
2. Fluxo de sucesso. (Fluxo)
3. Parâmetros de sucesso. (Variante)
4. Fluxo de Erro. (Fluxo)
5. Parâmetros de Erro. (Variante)

Observações:
1. É necessário ativar esse recurso nas configurações de autenticação no Painel do Firebase.
2. Endereço do console do Firebase: "https://console.firebase.google.com/".
3. O arquivo de configuração deverá ser upado no servidor do Maker Mobile através da opção "Configurações Adicionais" disponível na tela de exportação do projeto.
4. A  leitura do arquivo "google-services.json" (Android) ou "google-services.plist" (iOS) será realizada de forma automática.

---

## Firebase - Deslogar

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfLogoutFirebase` |
| **Código** | 870 |
| **Assinatura** | `Firebase - Deslogar ()` |
| **Tipo** | 31 |
| **Compatibilidade** | Cliente |

### Descrição

Esta função efetua logout do usuário autenticado no Firebase. 
Caso esta função seja chamada através de aplicativos móveis (Maker Mobile), a aplicação será encerrada.

Parâmetro:
Não possui.

Retorno:
Não possui.

---

## Firebase - Redefinir senha

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfResetPassword` |
| **Código** | 889 |
| **Assinatura** | `Firebase - Redefinir senha (Variante;Fluxo;Variante;Fluxo;Variante)` |
| **Parâmetros** | Variante;Fluxo;Variante;Fluxo;Variante |
| **Tipo** | 31 |
| **Compatibilidade** | Cliente |

### Descrição

Essa função redefine a senha correspondente ao e-mail informado via parâmetro. Lembrando que esse e-mail deve constar na lista de usuários cadastrados no projeto do Firebase.

Parâmetro(s):
1. E-mail. (Letras)
2. Fluxo de Sucesso. (Fluxo)
3. Parâmetros adicionais para o fluxo de sucesso. (Lista)
4. Fluxo de Erro. (Fluxo)
5. Parâmetros adicionais para o fluxo de erro. (Lista)

Retorno:
Não Possui.

Observações:
1. Caso o e-mail conste na lista de usuários cadastrados, o fluxo de sucesso será chamado recebendo no primeiro parâmetro um objeto JSON com as seguintes informações: 
{  
  "status": "OK",
  "mensagem":"Um link foi enviado ao seu e-mail para redefinir a sua senha."
}
2. Caso alguma inconsistência seja encontrada, o fluxo de erro será chamado recebendo no primeiro parâmetro um objeto JSON com as seguintes informações:
{  
  "status": "ERROR",
  "mensagem": "<erro que ocorreu>"
}

---

## Firebase - Usuário Logado?

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfAuthIsUserLoggedIn` |
| **Código** | 871 |
| **Assinatura** | `Firebase - Usuário Logado? (): Lógico` |
| **Retorno** | Lógico |
| **Tipo** | 31 |
| **Compatibilidade** | Cliente |

### Descrição

Verifica se há alguma sessão ativa do Firebase para o aplicativo que chamar a função.

Parâmetro:
Não possui.

Retorno:
True (verdadeiro), caso esteja logado. False (Falso), caso contrário. (Lógico)

---

## GPS - Desativar serviço de localização

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfDisconnectLocationService` |
| **Código** | 864 |
| **Assinatura** | `GPS - Desativar serviço de localização ()` |
| **Tipo** | 31 |
| **Compatibilidade** | Cliente |

### Descrição

Essa função encerra a conexão com o serviço GPS.

Parâmetro:
Não possui.

Retorno:
Não possui.

### Código Cliente (JavaScript)

```javascript
function ebfDisconnectLocationService(){
  alert("Disponível apenas no Maker Mobile");       
}
```

---

## GPS - Iniciar monitoramento

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfStartMonitoringGPS` |
| **Código** | 865 |
| **Assinatura** | `GPS - Iniciar monitoramento (Fluxo;Variante;Inteiro;Inteiro;Inteiro)` |
| **Parâmetros** | Fluxo;Variante;Inteiro;Inteiro;Inteiro |
| **Tipo** | 31 |
| **Compatibilidade** | Cliente |

### Descrição

Essa função inicia o monitoramento de localização.

Parâmetro(s):
1. Fluxo para receber dados do monitoramento. (Fluxo)
2. Parâmetros do fluxo. (Variante)
3. Prioridade. (Inteiro)
4. Intervalo em milissegundos. (Inteiro)
5. Intervalo mais rápido em milissegundos. (Inteiro)

Retorno: 
Não possui.

Observações:
1. O parâmetro "Prioridade" poderá ser:
  a - 100 para PRIORITY_HIGH_ACCURACY
  b - 104 para PRIORITY_LOW_POWER
  c - 105 para PRIORITY_NO_POWER
  d - 102 para PRIORITY_BALANCED_POWER_ACCURACY
2. Define o intervalo desejado para a atualização da localização.
3. Para mais informações sobre o parâmetro Prioridade, verifique a documentação do Android: "https://developers.google.com/android/reference/com/google/android/gms/location/LocationRequest.html".

### Código Cliente (JavaScript)

```javascript
function ebfStartMonitoringGPS(){
  alert("Disponível apenas no Maker Mobile");       
}
```

---

## GPS - Obter coordenada atual

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfGetCurrentLocation` |
| **Código** | 866 |
| **Assinatura** | `GPS - Obter coordenada atual (): Variante` |
| **Retorno** | Variante |
| **Tipo** | 31 |
| **Compatibilidade** | Cliente |

### Descrição

Esta função retorna a localização atual do dispositivo.

Parâmetro:
Não possui.

Retorno: 
Esta função retorna um JSON com as chaves: 
"latitude", "longitude", "altitude", "accurancy", "heading", "speed" e "timestamp". (Variante)

Observação:
Para a utilização dessa função, a função "GPS - Iniciar monitoramento" já deve ter sido utilizada.

### Código Cliente (JavaScript)

```javascript
function ebfGetCurrentLocation(){
  alert("Disponível apenas no Maker Mobile");  
}
```

---

## Gerar QRCode

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfGenerateQrCode` |
| **Código** | 824 |
| **Assinatura** | `Gerar QRCode (Letras): Letras` |
| **Parâmetros** | Letras |
| **Retorno** | Letras |
| **Tipo** | 31 |
| **Compatibilidade** | Cliente |

### Descrição

Essa função gera um QRCode a partir de uma sequência de caracteres informada retornando o endereço da imagem criada.

Parâmetro:
1. Texto que será codificado para o padrão QRCode. (Letras)

Retorno:
Caminho do arquivo do QRCode gerado. (Letras)

---

## Habilitar Aceleração de Hardware

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `SetHardwarAaccelerated` |
| **Código** | 872 |
| **Assinatura** | `Habilitar Aceleração de Hardware (Lógico)` |
| **Parâmetros** | Lógico |
| **Tipo** | 31 |
| **Compatibilidade** | Cliente |

### Descrição

Essa função habilita a aceleração de hardware do dispositivo.

Parâmetro:
1. Valor. Verdadeiro para ativar, falso para desativar. (Lógico)

Retorno:
Não possui.

---

## Habilitar Modo Depuração

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfEnableDebugMode` |
| **Código** | 828 |
| **Assinatura** | `Habilitar Modo Depuração (Lógico)` |
| **Parâmetros** | Lógico |
| **Tipo** | 31 |
| **Compatibilidade** | Cliente |

### Descrição

Essa função habilita o modo de depuração no aplicativo em questão quando executado no Android.

Parâmetro:
1. Ativar? (Lógico)

Retorno:
Não possui.

Observação:
A depuração remota deve está habilitado no computador e dispositivo. Mais detalhes:
https://developers.google.com/web/tools/chrome-devtools/remote-debugging/?hl=pt-br

### Código Cliente (JavaScript)

```javascript
function ebfEnableDebugMode(status){
  console.log('Compatível com o Maker Mobile');
}
```

---

## Interação de Confirmação Personalizada

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfShowConfirm` |
| **Código** | 613 |
| **Assinatura** | `Interação de Confirmação Personalizada (Letras;Letras;Letras;Fluxo;Variante)` |
| **Parâmetros** | Letras;Letras;Letras;Fluxo;Variante |
| **Tipo** | 31 |
| **Compatibilidade** | Cliente |

### Descrição

Esta função é usada para exibir uma Interação de Confirmação com personalização do título.
Será executado um fluxo quando o usuário clicar em OK ou CANCELAR, caso o usuário clique OK, o fluxo receberá como parâmetro de entrada a constante "1" ou "0" caso clique em CANCELAR.

Parâmetro(s):
1. Posição do botão CANCELAR. (Informe "D" para Direita ou "E" para Esquerda). (Letras)
2. Título da Interação. (Letras)
3. Mensagem a ser exibida. (Letras)
4. Fluxo que será executado ao clicar em OK ou CANCELAR. (Fluxo)
5. Lista de Parâmetros adicionais para o fluxo. (Variante, Opcional)

Observação:
O fluxo do 4º deverá ter obrigatoriamente 1 parâmetro para receber o resultado do clique.

### Código Cliente (JavaScript)

```javascript
function ebfShowConfirm(orderOK, title,msg,func,args) {
//Somente para MakerMobile.
}
```

---

## Ler código de barras ou QRCode

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfScanCode` |
| **Código** | 611 |
| **Assinatura** | `Ler código de barras ou QRCode (Fluxo;Fluxo;Letras)` |
| **Parâmetros** | Fluxo;Fluxo;Letras |
| **Tipo** | 31 |
| **Compatibilidade** | Cliente |

### Descrição

Função para realizar a leitura de código de barras, QRCode e outros padrões.

Parâmetro(s):
1. Fluxo a ser executado em caso de sucesso. 
2. Fluxo a ser executado em caso de erro. 
3. Formato a escanear. (Letras, Opcional) 

Retorno:
Retorna o conteúdo do código de barras. (Letras)

Observações:
1. Por padrão, o Scan buscará por qualquer tipo de código de barras suportado pela biblioteca, que são:
    - QR_CODE
    - CODE_128
    - CODE_39
    - EAN_13
    - EAN_8
    - ITF
    - UPC_A
2. O terceiro parâmetro deve ser informado os tipos a serem buscado. Caso não seja informado nenhum tipo, o scanner
buscará por qualquer tipo.
3. Os formatos devem ser passados como texto e separados por vírgula.

### Código Cliente (JavaScript)

```javascript
function ebfScanCode(success, error, types) {
 
}
```

---

## Limpar Shared Preferences

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfClearPreferences` |
| **Código** | 854 |
| **Assinatura** | `Limpar Shared Preferences (Letras)` |
| **Parâmetros** | Letras |
| **Tipo** | 31 |
| **Compatibilidade** | Mobile |

### Descrição

Remove o conteúdo da Shared Preferences.

Parâmetro:
1. Nome do preferences que terá o conteúdo removido.

Retorno:
Não possui.

---

## Maker Mobile - Logar com Facebook

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfFacebookLoginMobile` |
| **Código** | 819 |
| **Assinatura** | `Maker Mobile - Logar com Facebook (Fluxo;Variante;Fluxo;Variante;Variante)` |
| **Parâmetros** | Fluxo;Variante;Fluxo;Variante;Variante |
| **Tipo** | 31 |
| **Compatibilidade** | Cliente |

### Descrição

Solicita autorização para logar com o Facebook do usuário.

Parâmetro(s):
1. Fluxo de sucesso.
2. Parâmetros extras para o fluxo de sucesso. (Variante)
3. Fluxo de erro.
4. Parâmetros extras para o fluxo de erro. (Variante)
5. Lista de parâmetros de permissões para o Facebook. (Variante)

Retorno: 
Não possui.

Observações:
1. É necessário definir o ID da aplicação do Facebook na propriedade "Avançado" da área de trabalho do projeto, com a descrição FacebookID.
2. O fluxo de sucesso deverá conter um parâmetro do tipo variante, onde receberá um JSON com as informações solicitadas no parâmetro 5.
   2.1. As permissões podem ser encontradas no seguinte link: https://developers.facebook.com/docs/facebook-login/permissions
3. É necessário definir a seguinte Hash chave nas definições do seu projeto Android: 0WIQzU0HT5kEuWsgE7jqZDZDQOU=

### Código Cliente (JavaScript)

```javascript
function ebfFacebookLoginMobile(){
  console.log("Disponível apenas no Maker Mobile");
}
```

---

## Maker Mobile - Obter Diretório Padrão

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfGetDefaultDir` |
| **Código** | 994 |
| **Assinatura** | `Maker Mobile - Obter Diretório Padrão (Letras): Letras` |
| **Parâmetros** | Letras |
| **Retorno** | Letras |
| **Tipo** | 31 |
| **Compatibilidade** | Mobile |

### Descrição

Essa função obtém o diretório padrão do dispositivo de acordo com o valor informado por parâmetro.

Parâmetro:
1. Diretório. (Letras)

Retorno:
Diretório padrão do dispositivo. (Letras)

Observações:
1. Essa função só é compatível com o sistema operacional Android.
2. Os possíveis valores que podem serem informados como parâmetros são:
  - DIRECTORY_MUSIC
  - DIRECTORY_PODCASTS
  - DIRECTORY_RINGTONES
  - DIRECTORY_ALARMS
  - DIRECTORY_NOTIFICATIONS
  - DIRECTORY_PICTURES
  - DIRECTORY_MOVIES
  - DIRECTORY_DOWNLOADS
  - DIRECTORY_DCIM
  - DIRECTORY_DOCUMENTS

---

## Obter Coordenadas

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfGetGPSCoords` |
| **Código** | 445 |
| **Assinatura** | `Obter Coodernadas (Fluxo, Fluxo) : Não Possui` |
| **Parâmetros** | Fluxo;Fluxo |
| **Tipo** | 31 |
| **Compatibilidade** | Cliente |

### Descrição

Obtém as coordenadas do dispositivo móvel que possui GPS.

Parâmetro(s):
1. Fluxo que será executado caso as coordenadas sejam obtidas com sucesso.
2. Fluxo que será executado caso haja algum erro durante a execução da função.

Retorno: 
Não possui.

Observações:
1. O fluxo informado no primeiro parâmetro deverá possuir um parâmetro de entrada do tipo Variante. A função enviará
automaticamente para o fluxo um mapa com as seguintes chaves "longitude", "latitude", "altitude", "accuracy", 
"altitude accuracy", "heading", "speed", "Timestamp".
2. O fluxo informado no segundo parâmetro deverá possuir um parâmetro de entrada do tipo Letras. A função enviará
automaticamente para o fluxo o erro encontrado na tentativa de obtenção das coordendas.

### Código Cliente (JavaScript)

```javascript
function ebfGetGPSCoords(flxSucess,flxError){
 
 function num() {
   var txt = "";
   for (i=0;i<8;i++) {
     txt+= new String(parseInt(parseNumeric(9) * Math.random()));
   }  
 return txt;
 }

 var obj = new Map();
 obj.add('longitude', num());
 obj.add('latitude', num());
 obj.add('altitude', '1000000');
 obj.add('accuracy', '1000000');
 obj.add('altitude Accuracy', '1000000');
 obj.add('heading', '1000000');
 obj.add('speed', '1000000');
 obj.add('timestamp', '01/01/2011 12:00');
 var list = new Array();
 list.push(obj); 
 var func = window.eval(reduceVariable(flxSucess)); 
 var system = ($mainform().d.WFRForm ? $mainform().d.WFRForm.sys.value : $mainform().sysCode);
 var sysCode = system.toString().substring(0, 3);
 var formID = ($mainform().d.WFRForm ? $mainform().d.WFRForm.formID.value : null);   

 var ruleInstance = new func(null, sysCode, formID);     
 ruleInstance.run.apply(ruleInstance, list); 
}
```

---

## Obter Nome do Pacote

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfgetPackageName` |
| **Código** | 851 |
| **Assinatura** | `Obter Nome do Pacote (): Letras` |
| **Retorno** | Letras |
| **Tipo** | 31 |
| **Compatibilidade** | Mobile |

### Descrição

Essa função retorna o nome do pacote do projeto (Bundle).

Parâmetro:
Não possui.

Retorno:
Nome do pacote onde foi utilizada. (Letras)

---

## Obter contéudo Shared Preferences

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfGetAllPreferences` |
| **Código** | 855 |
| **Assinatura** | `Obter contéudo Shared Preferences (Letras): Letras` |
| **Parâmetros** | Letras |
| **Retorno** | Letras |
| **Tipo** | 31 |
| **Compatibilidade** | Mobile |

### Descrição

Essa função obtém todo o conteúdo que foi inserido no shared preferences.

Parâmetro:
1. Nome do preferences que deseja obter o conteúdo. (Letras)

Retorno:
Conteúdo armazenado. (Letras)

---

## Obter imagem da câmera ou galeria

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfGetImageCam` |
| **Código** | 446 |
| **Assinatura** | `Obter imagem da câmera ou galeria (Fluxo;Fluxo;Inteiro;Letras;Lógico)` |
| **Parâmetros** | Fluxo;Fluxo;Inteiro;Letras;Lógico |
| **Tipo** | 31 |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Obtém a imagem da câmera ou galeria do dispositivo móvel.

Parâmetro(s):
1. Fluxo que será executado caso a imagem seja obtida com sucesso.
2. Fluxo que será executado caso haja algum erro durante a execução da função.
3. Qualidade da imagem (1 a 100%). (Inteiro)
4. Tipo de Abertura. (Letras, Opcional) 
    0. Padrão: Será aberta uma caixa de diálogo padrão (permitindo a escolha de câmera ou galeria);
    1. Câmera: A câmera será aberta diretamente;
    2. Galeria: A galeria será aberta diretamente.
5. Seleção múltipla? (Apenas para o modo Galeria) (Lógico)
     
Retorno: 
Não possui.

Observações:
1. O fluxo chamado no primeiro parâmetro, caso a imagem seja obtida com sucesso, receberá o caminho da imagem que foi gravada/obtida.
2. Se o fluxo chamado tiver o intuito de alterar o valor de um componente imagem, utilize a função "Alterar imagem do 
componente".
3. A execução do fluxo não é interrompida com a chamada desta função.
Observações:
4. Caso seja informação Seleção Múltipla e seja informada a opção 2 (Galeria), o fluxo de sucesso receberá uma lista contendo um ou mais arquivos selecionados.

---

## Obter tipo da plataforma

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfGetTypePlatform` |
| **Código** | 888 |
| **Assinatura** | `Obter tipo da plataforma (): Letras` |
| **Retorno** | Letras |
| **Tipo** | 31 |
| **Compatibilidade** | Cliente |

### Descrição

Retorna em qual plataforma o aplicativo está sendo executado.

Parâmetro:
Não possui.

Retorno:
iOS ou Android.

### Código Cliente (JavaScript)

```javascript
function ebfGetTypePlatform(){
  return "";
}
```

---

## Ocultar Teclado

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfHiddenKeyboard` |
| **Código** | 878 |
| **Assinatura** | `Ocultar Teclado ()` |
| **Tipo** | 31 |
| **Compatibilidade** | Cliente |

### Descrição

Esta função oculta o teclado do dispositivo móvel.

Parâmetro:
Não possui.

Retorno:
Não possui.

### Código Cliente (JavaScript)

```javascript
function ebfHiddenKeyboard(){
 alert('Função disponível no Maker Mobile');
}
```

---

## Push - Enviar Mensagem - Firebase

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfSendPushListElementsFirebase` |
| **Código** | 762 |
| **Assinatura** | `Push - Enviar Mensagem - Firebase (Variante;Letras;Letras;Letras;Variante): Variante` |
| **Parâmetros** | Variante;Letras;Letras;Letras;Variante |
| **Retorno** | Variante |
| **Tipo** | 31 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Essa função envia mensagens via Push.

Parâmetro(s):
1. Lista contendo IDS dos dispositivos. (Variante)
2. API KEY fornecido pelo Firebase. (Letras)
3. Título da mensagem que será enviada. (Letras)
4. Mensagem que será enviada. (Letras)
5. Mapa com parâmetros extras. (Variante)

Retorno:
JSON retornado do Firebase. (Variante)

### Código Servidor (Java)

```java
protected final Variant ebfSendPushListElementsFirebase(Variant devices, Variant api, Variant title, Variant message, Variant params) throws Exception{
  List dispositivos         = (List) devices.getObject();
  String apiKey             = api.getString();
  String titulo             = title.getString();
  String mensagem           = message.getString();  
  Map parametros            = (Map) params.getObject();     
  
  if (parametros == null) 
    parametros = new java.util.HashMap();

  String result = "";
  java.net.URL url = new java.net.URL("https://fcm.googleapis.com/fcm/send");
  java.net.HttpURLConnection conn = (java.net.HttpURLConnection) url.openConnection();

  conn.setUseCaches(false);
  conn.setDoInput(true);
  conn.setDoOutput(true);

  conn.setRequestMethod("POST");
  conn.setRequestProperty("Authorization", "key=" + apiKey);    
  if (wfr.util.Settings.CHARSET != "UTF-8") {
    conn.setRequestProperty("Content-Type", "application/json;charset=iso-8859-1");
  } else {   
    conn.setRequestProperty("Content-Type", "application/json;charset=utf-8");
  }
  

  org.json.simple.JSONObject json = new org.json.simple.JSONObject();

  json.put("registration_ids", dispositivos);

  org.json.simple.JSONObject info = new org.json.simple.JSONObject();
  //Android
  info.put("title", titulo);
  info.put("message", mensagem);
  info.put("params", parametros);

  json.put("data", info);

  //iOS
  info.put("body", mensagem);
  json.put("notification", info);

    try {
      java.io.OutputStreamWriter wr = new java.io.OutputStreamWriter(conn.getOutputStream());
      wr.write(json.toString());
      wr.flush();

      java.io.BufferedReader br = new java.io.BufferedReader(new java.io.InputStreamReader((conn.getInputStream())));

      result = br.readLine();
    } catch (Exception e) {
      throw new Exception("Erro ao enviar Push " + e.getMessage());
    }

  return ebfCreateObjectJSON(VariantPool.get(result));

}
```

---

## Push - Enviar Mensagem - Firebase V1

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfSendPushFirebaseV1` |
| **Código** | 1046 |
| **Assinatura** | `Push - Enviar Mensagem - Firebase V1 (Letras;Letras;Letras;Letras;Letras;Variante): Variante` |
| **Parâmetros** | Letras;Letras;Letras;Letras;Letras;Variante |
| **Retorno** | Variante |
| **Tipo** | 31 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Essa função envia mensagens via Push utilizando o FCM V1.
Ao utilizar essa função para envio de mensagens Push, o aplicativo deve estar compilado com a versão 3.6.35 ou superior. A versão 3.6.35 foi disponibilizada no dia 25/01/2024, qualquer aplicativo compilado depois dessa data já tem suporte ao recebimento de mensagens Push via FCM V1.

Parâmetro(s):
1. Token do Dispositivo. (Letras)
2. Chave de API (Arquivo .json fornecido pela Google)(Ver Observação 4) (Letras)
3. ID do Projeto do Firebase (projectId) (Letras)
4. Título da mensagem que será enviada. (Letras)
5. Mensagem que será enviada. (Letras)
6. Mapa com parâmetros extras. (Variante)(Opcional)

Retorno:
JSON retornado do Firebase. (Variante)

Observações:
1. Na versão V1 do Firebase Cloud Functions(FCM), o envio de mensagens para múltiplos dispositivos foi depreciado.
2. A função retorna um JSON com o resultado do envio da mensagem.
3. O sexto parâmetro é opcional.
4. O Arquivo .json é fornecido pela Google quando você habilita a API do Firebase Cloud Messaging V1 e cria sua própria chave de API. Informe o caminho desse arquivo no parâmetro correspondente.

### Código Servidor (Java)

```java
protected final Variant ebfSendPushFirebaseV1(Variant device, Variant pathKey, Variant projectId,
 Variant title, Variant message, Variant params) throws Exception {

  String titulo             = title.getString();
  String mensagem           = message.getString();
  Map parametros            = (Map) params.getObject();
  
  if (parametros == null)
    parametros = new java.util.HashMap();
  
  String[] SCOPES = {
    "https://www.googleapis.com/auth/firebase.messaging"
  };
  
  com.google.auth.oauth2.GoogleCredentials googleCredentials =  com.google.auth.oauth2.GoogleCredentials
      .fromStream(new java.io.FileInputStream(pathKey.getString()))
      .createScoped(java.util.Arrays.asList(SCOPES));
  googleCredentials.refresh();

  String result = "";
  java.net.URL url = new java.net.URL("https://fcm.googleapis.com/v1/projects/" + projectId.getString() + "/messages:send");
  java.net.HttpURLConnection conn = (java.net.HttpURLConnection) url.openConnection();
  conn.setUseCaches(false);
  conn.setDoInput(true);
  conn.setDoOutput(true);
  conn.setRequestMethod("POST");
  conn.setRequestProperty("Authorization", "Bearer " + googleCredentials.getAccessToken().getTokenValue());       
  conn.setRequestProperty("Content-Type", "application/json; UTF-8");
  
  org.json.simple.JSONObject json = new org.json.simple.JSONObject();
  org.json.simple.JSONObject jsonMessage = new org.json.simple.JSONObject();
  org.json.simple.JSONObject info = new org.json.simple.JSONObject();
  
  //Notification
  info.put("title", titulo);
  info.put("body", mensagem);
  
  jsonMessage.put("notification", info);    
  jsonMessage.put("token", device.getString());    
  jsonMessage.put("data", parametros);
  
  json.put("message", jsonMessage);

  try {
    java.io.OutputStreamWriter wr = new java.io.OutputStreamWriter(conn.getOutputStream());
    wr.write(json.toString());
    wr.flush();

    java.io.BufferedReader br = new java.io.BufferedReader(new java.io.InputStreamReader((conn.getInputStream())));

    result = br.readLine();
  } catch (Exception e) {
    e.printStackTrace();
    throw new Exception("Erro ao enviar Push " + e.getMessage());
  }

  return VariantPool.get(result);
}
```

---

## Push - Registrar Dispositivo

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfPushRegister` |
| **Código** | 749 |
| **Assinatura** | `Push - Registrar Dispositivo (Fluxo;Letras)` |
| **Parâmetros** | Fluxo;Letras |
| **Tipo** | 31 |
| **Compatibilidade** | Cliente |

### Descrição

Essa função realiza um registro para que a aplicação possa receber notificações via Push.

Parâmetro(s):
1. Fluxo que será executado ao registrar o dispositivo/usuário.
2. ID do Projeto (Utilizado para o Google Cloud Message/Firebase). (Letras)

Retorno:
Não possui.

Observações:
1. Para obter o registro da aplicação no Google, utilize o link https://console.firebase.google.com/
2. Para obter o registro da aplicação na Apple (APNS), utilize o link https://developer.apple.com/library/content/documentation/NetworkingInternet/Conceptual/RemoteNotificationsPG/index.html#//apple_ref/doc/uid/TP40008194-CH3-SW1
3. O fluxo associado no primeiro parâmetro, receberá automaticamente o código do dispositivo registrado no servidor de push. Caso ocorra falha, o fluxo receberá o código -403, que indica que ocorreu um erro no registro

### Código Cliente (JavaScript)

```javascript
function ebfPushRegister(onsucess, senderid){
  
  function guid() {
    return s4() + s4() + '-' + s4() + '-' + s4() + '-' + s4() + '-' + s4() + s4() + s4();
  }
  
  function s4() {
    return Math.floor((1 + Math.random()) * 0x10000).toString(16).substring(1);
  }
  
  ebfFlowExecute(onsucess, [guid()]);
}
```

---

## Push - Remover Registro

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfPushUnregister` |
| **Código** | 750 |
| **Assinatura** | `Push - Remover Registro (Fluxo)` |
| **Parâmetros** | Fluxo |
| **Tipo** | 31 |
| **Compatibilidade** | Cliente |

### Descrição

Remove o registro de Push do aplicativo instalado no dispositivo, fazendo com que este não receba mais notificações do aplicativo em questão.

Parâmetro:
1. Fluxo que será executado caso a remoção seja efetuada com sucesso.

Retorno:
Não possui.

---

## Trazer Aplicação para primeiro plano

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfAppBringToFront` |
| **Código** | 879 |
| **Assinatura** | `Trazer Aplicação para primeiro plano ()` |
| **Tipo** | 31 |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Traz a aplicação para primeiro plano. 

Parâmetro:
Não possui.

Observação:
O sistema operacional iOS não permite que o app seja colocado em primeiro plano sem a interação do usuário.

### Código Cliente (JavaScript)

```javascript
function ebfAppBringToFront(){
 alert('Função disponível apenas no MakerMobile');
}
```

---

## Waze - Abrir

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfOpenWaze` |
| **Código** | 880 |
| **Assinatura** | `Waze - Abrir ()` |
| **Tipo** | 31 |
| **Compatibilidade** | Cliente |

### Descrição

Essa função tem como objetivo abrir o aplicativo Waze.

Parâmetro:
Não possui.

Retorno:
Não possui.

---

## Waze - Fechar Conexão

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfCloseWaze` |
| **Código** | 881 |
| **Assinatura** | `Waze - Fechar Conexão ()` |
| **Tipo** | 31 |
| **Compatibilidade** | Cliente |

### Descrição

Essa função tem como objetivo encerrar a conexão do waze com o aplicativo.

Parâmetro:
Não possui.

Retorno:
Não possui.

Observação:
Essa função não fecha o aplicativo Waze.

---

## Waze - Inicializar SDK e navegar

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfStartWaze` |
| **Código** | 882 |
| **Assinatura** | `Waze - Inicializar SDK e navegar (Letras;Letras;Letras): Variante` |
| **Parâmetros** | Letras;Letras;Letras |
| **Retorno** | Variante |
| **Tipo** | 31 |
| **Compatibilidade** | Cliente |

### Descrição

Essa função tem como objetivo iniciar o aplicativo do Waze e navegar ao ponto de destino que foi especificado.

Parâmetro(s):
1. Endereço (Ponto de partida, caso não seja informado, será obtida a localização atual). (Letras, Opcional)
2. Latitude de Destino. (Letras)
3. Longitude de Destino. (Letras)

Retorno:
Retorno será JSON, e vazio caso a inicialização ocorra com sucesso. (Letras)

Observação:
Caso ocorra algum erro no processo de inicialização, será retornada uma string no formato JSON, onde será informado o erro na chave "mensagem".

---

## Waze - Obter Versão

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfGetWazeBuilderNumber` |
| **Código** | 883 |
| **Assinatura** | `Waze - Obter Versão (): Letras` |
| **Retorno** | Letras |
| **Tipo** | 31 |
| **Compatibilidade** | Cliente |

### Descrição

Essa função tem como objetivo obter a versão do aplicativo Waze.

Parâmetro:
Não possui.

Retorno:
Retorna o número da versão instalada. (Letras)

---

## [DEPRECIADO] Chamar Serviço Web para Dispositivos

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfWSCallN` |
| **Código** | 1173 |
| **Assinatura** | `[DEPRECIADO] Chamar Serviço Web para Dispositivos  (Letras;Letras;Letras;Variante;Variante): Variante` |
| **Parâmetros** | Letras;Letras;Letras;Variante;Variante |
| **Retorno** | Variante |
| **Tipo** | 31 |
| **Compatibilidade** | Banco de Dados |

### Descrição

ATENÇÃO: ESTA FUNÇÃO FOI DEPRECIADA. A INTERAÇÃO COM OBJETOS COM ATRAVÉS DE ACESSO NATIVO É UMA TECNOLOGIA LEGADA QUE ESTÁ SENDO DESCONTINUADA NA PLATAFORMA PARA MELHORAR A SEGURANÇA E A MANUTENIBILIDADE.

Chama um Webservice que são componentes que permitem às aplicações enviar e receber dados em formato XML, para aplicações em dispositivos móveis.

Parâmetro(s):
1. URL do Web Service. (Letras)
2. Porta. (Letras)
3. Nome do Método. (Letras)
4. Lista contendo o nome dos parâmetros esperados para o Webservice. (Variante)
5. Lista contendo os valores para cada parâmetro definido no item 4. (Variante)

Retorno: 
Retorna o resultado da chamada do serviço web. (Variante)

Observação:\nNo 1º Parâmetro deve sempre ter "http://" antes.

### Código Servidor (Java)

```java
protected final Variant ebfWSCallN(Variant url, Variant portName, Variant methodName, Variant argumentsNames, Variant argumentsValues) {
    System.out.println("ATENÇÃO: A função foi depreciada e não possui mais efeito.");
    return Variant.VARIANT_NULL;
  }
```

---

## Áudio - Iniciar Gravação

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfRecordVoice` |
| **Código** | 821 |
| **Assinatura** | `Áudio - Iniciar Gravação (Letras): Lógico` |
| **Parâmetros** | Letras |
| **Retorno** | Lógico |
| **Tipo** | 31 |
| **Compatibilidade** | Cliente |

### Descrição

Essa função inicia a gravação de um áudio através do microfone do aparelho celular.

Parâmetro(s):
1. Formato do áudio que será gravado. (Letras, Opcional)

Retorno:
"Verdadeiro" caso a gravação tenha sido iniciada e "falso" caso ocorra algum erro.

Observações:
1. O usuário precisa dar a permissão de uso do microfone para que seja iniciada a gravação.
2. Caso não seja informado o formato de saída da gravação do aúdio, o formato de saída será mp4.
3. É necessário utilizar a função  Parar Gravação Áudio para que a gravação seja finalizada.

---

## Áudio - Parar Gravação

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfStopAudioRecord` |
| **Código** | 822 |
| **Assinatura** | `Áudio - Parar Gravação (): Letras` |
| **Retorno** | Letras |
| **Tipo** | 31 |
| **Compatibilidade** | Cliente |

### Descrição

Essa função encerra a gravação de um áudio e retorna o endereço do arquivo gerado/gravado.

Parâmetro:
Não possui.

Retorno:
Endereço do arquivo de áudio que foi gravado (Letras).

Observação:
Essa função deverá ser chamada após o uso da função "Áudio - Iniciar Gravação".

---

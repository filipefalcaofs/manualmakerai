# Funções Nativas - Redes Sociais

Total: **8** funções

[← Voltar para Funções Nativas](README.md)

---

## Facebook - Comentários

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfFacebookComments` |
| **Código** | 683 |
| **Assinatura** | `Facebook - Comentários (Componente;Letras;Letras;Letras;Inteiro;Letras)` |
| **Parâmetros** | Componente;Letras;Letras;Letras;Inteiro;Letras |
| **Tipo** | 36 |
| **Compatibilidade** | Cliente |

### Descrição

Esta função abre uma caixa de comentários no componente moldura.

Parâmetro(s):
1. Nome da Moldura. (Componente)
2. AppID do Facebook. (Letras)
3. Tema: "light" ou "dark". (Letras)
4. Link da página que será associada aos comentários. (Letras)
5. Número de postagens exibidas. (Inteiro, Opcional)
6. Ordem: "social", "reverse_time" ou "time". (Letras, Opcional)

Retorno:
Não possui.

Observações:
1. O número de postagens mínimo é de "1" e o máximo "10".
2. Caso o 6º parâmetro não seja informado, o valor padrão adotado é "social".

### Código Cliente (JavaScript)

```javascript
function ebfFacebookComments(component, appid, colorscheme, href, num_posts, order_by){
  if(isNullable(appid)){
    throw "App ID é um parâmetro obrigatório";
  }
  var meta = document.createElement("meta");
  meta.setAttribute("property","fb:app_id");
  meta.setAttribute("content",appid);
  document.head.appendChild(meta);
  if(typeof(FB)==="undefined"){
    var FBLoadEvent = document.createEvent("Event");
    FBLoadEvent.initEvent("fbload", false, false);
    window.fbAsyncInit = function() {
      FB.init({
        "appId":appid,
        "status":true,      
        "xfbml":true,
        "version":"v2.0"
      });
      window.dispatchEvent(FBLoadEvent);
    };
  }
  if(typeof(FB)==="object"){
    FB.init({
      "appId":appid,
      "status":true,      
      "xfbml":true,
      "version":"v2.0"
    });
  }
  (function(d, s, id){
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) {return;}
    js = d.createElement(s); js.id = id;
    js.src = "//connect.facebook.net/"+$mainform().ebfCurrentLanguage()+"/sdk.js";
    fjs.parentNode.insertBefore(js, fjs);
  }(document, 'script', 'facebook-jssdk'));
  var elem = $c(component).div;  
  elem.className = "fb-comments";
  elem.setAttribute("data-width",$c(component).getWidth());
  if(!isNullable(colorscheme)){
    elem.setAttribute("data-colorscheme",colorscheme);
  }
  if(!isNullable(href)){
    elem.setAttribute("data-href",href);
  }
  if(!isNullable(num_posts)){
    elem.setAttribute("data-numposts",num_posts);
  }
  if(!isNullable(order_by)){
    elem.setAttribute("data-order-by",order_by);
  }
  if(typeof(FB)!=="undefined"){
    FB.XFBML.parse(elem.parentNode);
  }
}
```

---

## Facebook - Compartilhar

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfFacebookShare` |
| **Código** | 682 |
| **Assinatura** | `Facebook - Compartilhar (Componente;Letras;Letras)` |
| **Parâmetros** | Componente;Letras;Letras |
| **Tipo** | 36 |
| **Compatibilidade** | Cliente |

### Descrição

Esta função habilita a opção de compartilhar um determinado link/página.

Parâmetro(s):
1. Nome da Moldura. (Componente)
2. Layout: "box_count", "button_count", "button", "icon_link", "icon" ou "link". (Letras, Opcional)
3. Link da página a ser compartilhada. (Letras)

Retorno:
Não possui.

Observação:
A altura do botão "compartilhar" é determinada pelo layout escolhido no 2º parâmetro. A largura do botão será determinada pela largura do componente moldura.

### Código Cliente (JavaScript)

```javascript
function ebfFacebookShare(component, layout, href){
  if(!window.fbAsyncInit){
    var FBLoadEvent = document.createEvent("Event");
    FBLoadEvent.initEvent("fbload", false, false);
    window.fbAsyncInit = function() {
      FB.init({
        "xfbml":true,
        "version":"v2.0"
      });
      window.dispatchEvent(FBLoadEvent);
    };
  }
  (function(d, s, id){
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) {return;}
    js = d.createElement(s); js.id = id;
    js.src = "//connect.facebook.net/"+$mainform().ebfCurrentLanguage()+"/sdk.js";
    fjs.parentNode.insertBefore(js, fjs);
  }(document, 'script', 'facebook-jssdk'));
  var elem = $c(component).div;  
  elem.className = "fb-share-button";
  elem.setAttribute("data-width",$c(component).getWidth());
  if(!isNullable(layout)){
    elem.setAttribute("data-type",layout);
  }
  if(!isNullable(href)){
    elem.setAttribute("data-href",href);
  }
  if(typeof(FB)!=="undefined"){
    FB.XFBML.parse(elem.parentNode);
  }
}
```

---

## Facebook - Exibir Caixa de Fãs

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfFacebookLikeBox` |
| **Código** | 681 |
| **Assinatura** | `Facebook - Exibir Caixa de Fãs (Componente;Letras;Letras;Lógico;Lógico;Lógico;Lógico)` |
| **Parâmetros** | Componente;Letras;Letras;Lógico;Lógico;Lógico;Lógico |
| **Tipo** | 36 |
| **Compatibilidade** | Cliente |

### Descrição

Esta função permite a visualização das últimas publicações da página e/ou os usuários do Facebook que curtem a página.

Parâmetro(s):
1. Componente Moldura.
2. Link da página do Facebook a ser curtida. (Letras)
3. Tema: "light" ou "dark", padrão é "light". (Letras, Opcional)
4. Mostrar cabeçalho? (Lógico, Opcional)
5. Mostrar borda da caixa? (Lógico, Opcional)
6. Mostrar fotos dos perfis? (Lógico, Opcional)
7. Mostrar últimas postagens da página? (Lógico, Opcional)

Retorno:
Não possui.

Observações:
1. O 4º e o 5º Parâmetro possuem o valor padrão "verdadeiro".
2. Por padrão, as fotos dos perfis não são exibidas no 6º Parâmetro.
3. Por padrão, as últimas postagens da página não são exibidas no 7º Parâmetro.

### Código Cliente (JavaScript)

```javascript
function ebfFacebookLikeBox(component, href, colorscheme, header, show_border, show_faces, stream){
  if(!window.fbAsyncInit){
    var FBLoadEvent = document.createEvent("Event");
    FBLoadEvent.initEvent("fbload", false, false);
    window.fbAsyncInit = function() {
      FB.init({
        "xfbml":true,
        "version":"v2.0"
      });
      window.dispatchEvent(FBLoadEvent);
    };
  }
  (function(d, s, id){
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) {return;}
    js = d.createElement(s); js.id = id;
    js.src = "//connect.facebook.net/"+$mainform().ebfCurrentLanguage()+"/sdk.js";
    fjs.parentNode.insertBefore(js, fjs);
  }(document, 'script', 'facebook-jssdk'));
  var elem = $c(component).div;
  elem.className = "fb-like-box";
  elem.setAttribute("data-width",$c(component).getWidth());
  elem.setAttribute("data-height",$c(component).getHeight());
  if(!isNullable(href)){
    elem.setAttribute("data-href",href);
  }
  if(!isNullable(colorscheme)){
    elem.setAttribute("data-colorscheme",colorscheme);
  }
  if(!isNullable(header)){
    elem.setAttribute("data-header",header);
  }
  if(!isNullable(show_border)){
    elem.setAttribute("data-show-border",show_border);
  }
  if(!isNullable(show_faces)){
    elem.setAttribute("data-show-faces",show_faces);
  }
  if(!isNullable(stream)){
    elem.setAttribute("data-stream",stream);
  }
  if(typeof(FB)!=="undefined"){
    FB.XFBML.parse(elem.parentNode);
  }
}
```

---

## Facebook - Exibir Postagem

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfFacebookPost` |
| **Código** | 684 |
| **Assinatura** | `Facebook - Exibir Postagem (Componente;Letras)` |
| **Parâmetros** | Componente;Letras |
| **Tipo** | 36 |
| **Compatibilidade** | Cliente |

### Descrição

Esta função exibe uma postagem do Facebook no componente moldura passado como parâmetro.

Parâmetro(s):
1. Nome da Moldura. (Componente)
2. Link da postagem do Facebook. (Letras)

Retorno:
Não possui.

### Código Cliente (JavaScript)

```javascript
function ebfFacebookPost(component, href){
  if(!window.fbAsyncInit){
    var FBLoadEvent = document.createEvent("Event");
    FBLoadEvent.initEvent("fbload", false, false);
    window.fbAsyncInit = function() {
      FB.init({
        "xfbml":true,
        "version":"v2.0"
      });
      window.dispatchEvent(FBLoadEvent);
    };
  }
  (function(d, s, id){
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) {return;}
    js = d.createElement(s); js.id = id;
    js.src = "//connect.facebook.net/"+$mainform().ebfCurrentLanguage()+"/sdk.js";
    fjs.parentNode.insertBefore(js, fjs);
  }(document, 'script', 'facebook-jssdk'));
  var elem = $c(component).div;  
  elem.className = "fb-post";
  elem.setAttribute("data-width",$c(component).getWidth());
  if(!isNullable(href)){
    elem.setAttribute("data-href",href);
  }
  if(typeof(FB)!=="undefined"){
    FB.XFBML.parse(elem.parentNode);
  }
}
```

---

## Facebook - Habilitar Curtir/Recomendar

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfFacebookLike` |
| **Código** | 678 |
| **Assinatura** | `Facebook - Habilitar Curtir/Recomendar (Componente;Letras;Letras;Lógico;Letras;Lógico)` |
| **Parâmetros** | Componente;Letras;Letras;Lógico;Letras;Lógico |
| **Tipo** | 36 |
| **Compatibilidade** | Cliente |

### Descrição

Esta função habilita a opção de curtir/recomendar para uma determinada página/link.

Parâmetro(s):
1. Nome da Moldura. (Componente)
2. Layout: "standard", "box_count", "button_count" ou "button". (Letras, Opcional)
3. Ação: "like" ou "recommend". (Letras, Opcional)
4. Mostrar foto do perfil? (Lógico, Opcional)
5. Link da página a ser curtida/recomendada. (Letras, Opcional)
6. Incluir compartilhar? (Lógico, Opcional)

Retorno:
Não Possui.

Observações:
1. O 4º Parâmetro só é aplicado para o layout "standard".
2. Caso o 5º Parâmetro não seja informado, a página atual será adotada.

### Código Cliente (JavaScript)

```javascript
function ebfFacebookLike(component, layout, action, show_faces, href, share){
  if(!window.fbAsyncInit){
    var FBLoadEvent = document.createEvent("Event");
    FBLoadEvent.initEvent("fbload", false, false);
    window.fbAsyncInit = function() {
      FB.init({
        "xfbml":true,
        "version":"v2.0"
      });
      window.dispatchEvent(FBLoadEvent);
    };
  }
  (function(d, s, id){
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) {return;}
    js = d.createElement(s); js.id = id;
    js.src = "//connect.facebook.net/"+$mainform().ebfCurrentLanguage()+"/sdk.js";
    fjs.parentNode.insertBefore(js, fjs);
  }(document, 'script', 'facebook-jssdk'));
  var elem = $c(component).div;
  elem.className = "fb-like";
  elem.setAttribute("data-width",$c(component).getWidth());
  if(!isNullable(layout)){
    elem.setAttribute("data-layout",layout);
  }
  if(!isNullable(action)){
    elem.setAttribute("data-action",action);
  }
  if(!isNullable(show_faces)){
    elem.setAttribute("data-show-faces",show_faces);
  }
  if(!isNullable(href)){
    elem.setAttribute("data-href",href);
  }
  if(!isNullable(share)){
    elem.setAttribute("data-share",share);
  }
  if(typeof(FB)!=="undefined"){
    FB.XFBML.parse(elem.parentNode);
  }
}
```

---

## Facebook - Login/Logout

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfFacebookLogin` |
| **Código** | 677 |
| **Assinatura** | `Facebook - Login/Logout (Componente;Letras;Lógico;Inteiro;Fluxo;Variante;Variante;Letras;Lógico)` |
| **Parâmetros** | Componente;Letras;Lógico;Inteiro;Fluxo;Variante;Variante;Letras;Lógico |
| **Tipo** | 36 |
| **Compatibilidade** | Cliente |

### Descrição

Esta função habilita a opção de login/logout no Facebook.

Parâmetro(s):
1. Nome da Moldura. (Componente)
2. AppID do Facebook. (Letras)
3. Habilitar Sair? (Lógico)
4. Quantidade de linhas de perfis a serem exibidos (Inteiro, Opcional)
5. Fluxo a ser executado no login/logout. (Fluxo, Opcional)
6. Parâmetros adicionais para o fluxo. (Variante)
7. Lista de permissões requisitadas. (Variante, Opcional)
8. Tamanho do botão de login. (Letras)
9. Mostrar Foto do Perfil? (Lógico)

Retorno:
Não possui.

Observações:
1. Por padrão, somente o perfil público do usuário é requisitado no 7º Parâmetro. A lista completa de permissões poderá ser obtida em "https://developers.facebook.com/docs/facebook-login/permissions/v2.0#reference".
2. As seguintes opções são válidas para o 8º parâmetro: "small", "medium", "large" ou "xlarge".

### Código Cliente (JavaScript)

```javascript
function ebfFacebookLogin(component, appid, auto_logout_link, max_rows, onlogin, params, scope, size, show_faces){
  if(isNullable(appid)){
    throw "App ID é um parâmetro obrigatório";
  }
  if(typeof(FB)==="undefined"){
    var FBLoadEvent = document.createEvent("Event");
    FBLoadEvent.initEvent("fbload", false, false);
    window.fbAsyncInit = function() {
      FB.init({
        "appId":appid,
        "status":true,      
        "xfbml":true,
        "version":"v2.0"
      });
      window.dispatchEvent(FBLoadEvent);
    };
  }
  if(typeof(FB)==="object"){
    FB.init({
      "appId":appid,
      "status":true,      
      "xfbml":true,
      "version":"v2.0"
    });
  }
  (function(d, s, id){
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) {return;}
    js = d.createElement(s); js.id = id;
    js.src = "//connect.facebook.net/"+$mainform().ebfCurrentLanguage()+"/sdk.js";
    fjs.parentNode.insertBefore(js, fjs);
  }(document, 'script', 'facebook-jssdk'));
  var elem = $c(component).div;  
  elem.className = "fb-login-button";
  if(!isNullable(auto_logout_link)){
    elem.setAttribute("data-auto-logout-link",auto_logout_link);
  }
  if(!isNullable(max_rows)){
    elem.setAttribute("data-max-rows",max_rows);
  }
  if(!isNullable(onlogin)){
    if(isNullable(params)){
      params = [];
    }
    elem.setAttribute("data-onlogin","ebfFlowExecute('"+onlogin+"',"+(JSON.stringify(params)).replace(/\"/g,"'")+")");
  }
  if(!isNullable(scope)){
    elem.setAttribute("data-scope",scope);
  }else{
    elem.setAttribute("data-scope","public_profile");
  }
  if(!isNullable(size)){
    elem.setAttribute("data-size",size);
  }
  if(!isNullable(show_faces)){
    elem.setAttribute("data-show-faces",show_faces);
  }
  if(typeof(FB)!=="undefined"){
    FB.XFBML.parse(elem.parentNode);
  }
}
```

---

## Facebook - Obter Status do aplicativo

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfFacebookAppStatus` |
| **Código** | 680 |
| **Assinatura** | `Facebook - Obter Status do aplicativo (Fluxo;Variante)` |
| **Parâmetros** | Fluxo;Variante |
| **Tipo** | 36 |
| **Compatibilidade** | Cliente |

### Descrição

Esta função verifica o estado do aplicativo e se a sessão do usuário está definida como logado ou não no Facebook. 

Parâmetro(s):
1. Fluxo que receberá o Status do Aplicativo. (Fluxo)
2. Lista de Parâmetros do fluxo. (Variante, Opcional)

Retorno:
Não possui.

Observação:
O fluxo chamado no 1º Parâmetro receberá o Status do aplicativo. O status pode ser "connected" quando o 
usuário autenticou a permissão do aplicativo no Facebook, "not_authorized" quando está logado no Facebook mas não 
autenticado no Aplicativo ou  "unknown" quando não está logado no Facebook, então não se sabe se está autenticado 
no Aplicativo.

### Código Cliente (JavaScript)

```javascript
function ebfFacebookAppStatus(fluxo, params){
  var funcao = function(){
    window.removeEventListener("fbload", funcao, false);
    FB.getLoginStatus(function(response) {
      response = [response.status];
      if(!isNullable(params)){
        for(key in params){
          if(params.propertyIsEnumerable(key))
            response.push(params[key]);
        }
      }
      ebfFlowExecute(fluxo, response);
    });
  }
  if(typeof(FB)==="undefined"){
    window.addEventListener("fbload", funcao, false);
  }else{
    funcao();
  }
}
```

---

## Facebook - Sugerir Recomendação

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfFacebookRecommendationsBar` |
| **Código** | 679 |
| **Assinatura** | `Facebook - Sugerir Recomendação (Letras;Letras;Letras;Variante;Inteiro;Letras)` |
| **Parâmetros** | Letras;Letras;Letras;Variante;Inteiro;Letras |
| **Tipo** | 36 |
| **Compatibilidade** | Cliente |

### Descrição

Esta função permite recomendar uma página/link de sites externos.

Parâmetro(s):
1. App ID do Facebook. (Letras)
2. Ação: "like" ou "recommend". (Letras, Opcional)
3. Link da página a ser recomendada. (Letras, Opcional)
4. Lista de domínios. (Variante, Opcional)
5. Quantidade de recomendações. (Inteiro, Opcional)
6. Posição da barra de recomendações: "left" ou "right". (Letras, Opcional)

Retorno:
Não possui.

Observação:
Caso 5º Parâmetro não seja informado, o valor padrão adotado são 2. O valor máximo de domínios são 5.

### Código Cliente (JavaScript)

```javascript
function ebfFacebookRecommendationsBar(appid, action, href, site, num_recommendations, side){
  if(isNullable(appid)){
    throw "App ID é um parâmetro obrigatório";
  }
  if(typeof(FB)==="undefined"){
    var FBLoadEvent = document.createEvent("Event");
    FBLoadEvent.initEvent("fbload", false, false);
    window.fbAsyncInit = function() {
      FB.init({
        "appId":appid,
        "status":true,      
        "xfbml":true,
        "version":"v2.0"
      });
      window.dispatchEvent(FBLoadEvent);
    };
  }
  if(typeof(FB)==="object"){
    FB.init({
      "appId":appid,
      "status":true,      
      "xfbml":true,
      "version":"v2.0"
    });
  }
  (function(d, s, id){
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) {return;}
    js = d.createElement(s); js.id = id;
    js.src = "//connect.facebook.net/"+$mainform().ebfCurrentLanguage()+"/sdk.js";
    fjs.parentNode.insertBefore(js, fjs);
  }(document, 'script', 'facebook-jssdk'));
  var elem = document.createElement("div");
  elem.className = "fb-recommendations-bar";
  document.body.appendChild(elem);
  if(!isNullable(action)){
    elem.setAttribute("data-action",action);
  }
  if(!isNullable(href)){
    elem.setAttribute("data-href",href);
  }
  if(!isNullable(site)){
    elem.setAttribute("data-site",site);
  }
  if(!isNullable(num_recommendations)){
    elem.setAttribute("data-num-recommendations",num_recommendations);
  }
  if(!isNullable(side)){
    elem.setAttribute("data-side",side);
  }
  if(typeof(FB)!=="undefined"){
    FB.XFBML.parse(elem.parentNode);
  }
}
```

---

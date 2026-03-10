# Funções Nativas - Google Maps

Total: **27** funções

[← Voltar para Funções Nativas](README.md)

---

## Mapa - Alternar Modo

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfMapsToggleStreetView` |
| **Código** | 658 |
| **Assinatura** | `Mapa - Alternar Modo (Variante)` |
| **Parâmetros** | Variante |
| **Tipo** | 35 |
| **Compatibilidade** | Cliente |

### Descrição

Esta função alterna entre o modo normal e o modo street view do mapa.

Parâmetro:
1. Objeto Street View. (Variante)

Retorno:
Não possui.

Observação:
O 1º Parâmetro é o retorno da função "Mapa - Entrar em Modo Street View".

### Código Cliente (JavaScript)

```javascript
function ebfMapsToggleStreetView(streetview) {
  if (streetview) {
    var toggle = streetview.getVisible();
    if (toggle == false) {
      streetview.setVisible(true);
    } else {
      streetview.setVisible(false);
    }
  }
}
```

---

## Mapa - Angular Mapa 45°

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfMapsAngle` |
| **Código** | 661 |
| **Assinatura** | `Mapa - Angular Mapa 45° (Variante;Letras)` |
| **Parâmetros** | Variante;Letras |
| **Tipo** | 35 |
| **Compatibilidade** | Cliente |

### Descrição

Esta função altera o ângulo de visualização do mapa para 45°.

Parâmetro(s):
1. Mapa. (Variante)
2. Tipo do mapa (hybrid ou satellite). (Letras)

Retorno:
Não possui.

Observações:
1. O 1º Parâmetro é o retorno da função "Mapa - Criar Mapa em uma Moldura";
2. Está função apenas funciona com os mapas do tipo "hybrid" ou "satellite";

### Código Cliente (JavaScript)

```javascript
function ebfMapsAngle(map, type) {
  if (map) {
    map.setMapTypeId(type);
    map.setTilt(45);
  }
}
```

---

## Mapa - Associar Evento

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfMapsAddListener` |
| **Código** | 664 |
| **Assinatura** | `Mapa - Associar Evento (Variante;Letras;Fluxo;Variante;Letras;Lógico)` |
| **Parâmetros** | Variante;Letras;Fluxo;Variante;Letras;Lógico |
| **Tipo** | 35 |
| **Compatibilidade** | Cliente |

### Descrição

Esta função associa um evento ao mapa passado por parâmetro.

Parâmetro(s):
1. Mapa. (Variante)
2. Evento. (click, dblclick, drag...) (Letras)
3. Fluxo. (Opcional)  (Ver observação 3)
4. Lista de Parâmetros do Fluxo. (Variante, Opcional)
5. Caminho relativo do Ícone. (Letras, Opcional)
6. Criar Marcador? (Lógico) 

Retorno:
Não possui.

Observações:
1. O 1º Parâmetro é o retorno da função "Mapa - Criar Mapa em uma Moldura".
2. Mais informações sobre os eventos suportados, consulte: 
https://developers.google.com/maps/documentation/javascript/reference?hl=pt-br
3. O fluxo executado receberá dois parâmetros automáticos referentes a Latitude e Longitude respectivamente.
4. Caso o 6º Parâmetro seja verdadeiro, será criado um marcador toda vez que o evento for executado.

### Código Cliente (JavaScript)

```javascript
function ebfMapsAddListener(map, event, flow, param, image, addmarkers) {
  if (map) {   
    if(addmarkers==undefined){      
      addmarkers=true;          
    }
    google.maps.event.addListener(map, event, function(e){
      placeMarker(e.latLng, map, image, addmarkers);       
    });
    
    function placeMarker(position, map, image,addmarkers){
      if(addmarkers){
        var marker = new google.maps.Marker({
          position: position,
          map: map,
          icon: image
        }); 
      }

      var list = new Array();
      var pos = position.toString();
      pos = pos.replace("(", "");
      pos = pos.replace(")", "");
      var latlgn = pos.split(",");          
      list[0] = latlgn[0];
      list[1] = latlgn[1];     
      if(param){
        for (i = 0; i < param.length; i++) {
         list[i + 2] = param[i];
        }       
      }
      executeRuleFromJS(flow, list);
      map.panTo(position);
    }
  }
}
```

---

## Mapa - Associar Fluxo ao Evento do Marcador

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfMarkerAddEventListener` |
| **Código** | 757 |
| **Assinatura** | `Mapa - Associar Fluxo ao Evento do Marcador (Variante;Letras;Letras;Variante;Lógico)` |
| **Parâmetros** | Variante;Letras;Letras;Variante;Lógico |
| **Tipo** | 35 |
| **Compatibilidade** | Cliente |

### Descrição

Esta função associa um fluxo à um determinado marcador do mapa que será executado quando o evento for disparado.

Parâmetro(s):
1. Referência do Marcador. (Variante)
2. Tipo de Evento. (Letras)
3. Nome do Fluxo. (Letras)
4. Lista de Parâmetros do Fluxo. (Variante)
5. Objeto do Evento. (Lógico)

Retorno:
Não possui.

Observações:
1. A referência do marcador deve ser obtida através da função Mapa - Criar Marcador.
2. Os tipos de evento são os mesmos do JavaScript (click, dblclick, mouseover, etc...).
3. Caso o parâmetro Objeto do Evento for verdadeiro, o primeiro parâmetro do fluxo irá receber o objeto do evento.

### Código Cliente (JavaScript)

```javascript
function ebfMarkerAddEventListener (obj, evt, flow, params, eventObject){
  //params = params || [];
  eventObject = parseBoolean(eventObject);
  if(eventObject){  
    params.unshift(this);
    obj.addListener(evt, function(){               
      ebfSetRuleExecutionTime(flow, params, 0);
    });
  } else {
      obj.addListener(evt, function(){
        ebfSetRuleExecutionTime(flow, params, 0);
      }); 
  }
}
```

---

## Mapa - Calcular Distância Entre dois Pontos

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfMapsCalcDistBtwnTwoPoints` |
| **Código** | 668 |
| **Assinatura** | `Mapa - Calcular Distância Entre dois Pontos (Variante;Letras;Letras;Letras;Fluxo;Variante;Fluxo;Variante)` |
| **Parâmetros** | Variante;Letras;Letras;Letras;Fluxo;Variante;Fluxo;Variante |
| **Tipo** | 35 |
| **Compatibilidade** | Cliente |

### Descrição

Esta função calcula a distância e o tempo entre dois pontos.

Parâmetro(s):
1. Mapa. (Variante, Opcional)
2. Origem. (Letras)
3. Destino. (Letras)
4. Modo de Viagem. (DRIVING, WALKING, BICYCLING) (Letras)
5. Nome do Fluxo de sucesso.
6. Parâmetros do Fluxo de sucesso. (Variante, opcional)
7. Nome do Fluxo de erro.
8. Parâmetros do Fluxo de erro. (Variante, opcional)

Retorno:
Não possui.

Observações:
1. O primeiro parâmetro é o retorno da função "Mapa - Criar Mapa em uma Moldura";
2. Ao informar o mapa no primeiro parâmetro, a rota será traçada automaticamente.
3. O fluxo de sucesso receberá uma lista no primeiro parâmetro, contendo a distância em KM e o Tempo,  entre os dois pontos.

### Código Cliente (JavaScript)

```javascript
function ebfMapsCalcDistBtwnTwoPoints(map, addressStart, addressEnd, ModeTravel, ruleName, sucessParams, ruleNameError, errorParams) {
  var addressPoints;
  var result = new Array();
  var service = new google.maps.DistanceMatrixService();
  if (map) {
    ebfMapsTraceRoute(map, addressStart, addressEnd, addressPoints, ModeTravel);
  }
  service.getDistanceMatrix({
    origins : [ addressStart ],
    destinations : [ addressEnd ],
    travelMode : ModeTravel
  }, calc);

  function calc(response, status) {
    responseElements = response.rows[0].elements[0];
    if (status == google.maps.DistanceMatrixStatus.OK && responseElements.status == google.maps.DistanceMatrixElementStatus.OK) {
      result[0] = responseElements.distance.text;
      result[1] = responseElements.duration.text;
      result[2] = responseElements.distance.value;
      result[3] = responseElements.duration.value;
      
      if(sucessParams instanceof Array && sucessParams != null){
        sucessParams.unshift(result);
      }else{
        sucessParams[0] = result;
      }
      
      sucessParams.splice(0, 0, result);
      executeRuleFromJS(ruleName, sucessParams);
    } else {    
      if(ruleNameError != null){
        executeRuleFromJS(ruleNameError, errorParams);
      }
    }
  }
}
```

---

## Mapa - Camada de Sobreposição

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfMapsSetOverlay` |
| **Código** | 711 |
| **Assinatura** | `Mapa - Camada de Sobreposição (Variante;Variante;Inteiro;Lógico): Variante` |
| **Parâmetros** | Variante;Variante;Inteiro;Lógico |
| **Retorno** | Variante |
| **Tipo** | 35 |
| **Compatibilidade** | Cliente |

### Descrição

Permite criar ou modificar uma camada responsável pela visualização o tráfego atual, as rotas de transporte público ou rotas de ciclovia da cidade. 

Parâmetro(s):
1. Mapa. (Variante)
2. Referência da Camada. (Variante, Opcional)
3. Inteiro. (1-Tráfego, 2-Transporte Público, 3- Ciclovias)
4. Visível? (Lógico)

Retorno:
A função terá como retorno a referência da Camada criada/modificada. (Variante).

Observações:
1. O 1º Parâmetro é o retorno da função "Mapa - Criar Mapa em uma Moldura";
2. O 2º Parâmetro só deve especificado, caso seja necessário modificar uma camada existente.

Exemplo:
Assumindo como 1º Parâmetro: a Referência do Mapa, 2º Parâmetro: Nulo, 3º Parâmetro: 1, 4º Parâmetro: Verdadeiro. Será retornado a referência de uma camada visível responsável por exibir o tráfego atual no mapa.

### Código Cliente (JavaScript)

```javascript
function ebfMapsSetOverlay(map, mapLayer, opt, visible) {
    if (mapLayer instanceof google.maps.MVCObject && typeof mapLayer.setMap === 'function') {
        mapLayer.setMap(null);
    }
    if (opt === 1 || opt === '1') { 
      mapLayer = new google.maps.TrafficLayer();
    } else if (opt === 2 || opt === '2') {
      mapLayer = new google.maps.TransitLayer();
    } else if (opt === 3 || opt === '3') {
      mapLayer = new google.maps.BicyclingLayer();
    }
    if (visible) {
        mapLayer.setMap(map);
    }else{
      mapLayer.setMap(null);
    }
    return mapLayer;
}
```

---

## Mapa - Centralizar

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfMapsCenterMap` |
| **Código** | 660 |
| **Assinatura** | `Mapa - Centralizar (Variante;Fracionado;Fracionado)` |
| **Parâmetros** | Variante;Fracionado;Fracionado |
| **Tipo** | 35 |
| **Compatibilidade** | Cliente |

### Descrição

Esta função centraliza o mapa de acordo com as coordenadas passadas.

Parâmetro(s):
1. Mapa. (Variante)
2. Latitude. (Fracionado)
3. Longitude. (Fracionado)

Retorno:
Não possui.

Observação:
O 1º Parâmetro é o retorno da função "Mapa - Criar Mapa em uma Moldura".

### Código Cliente (JavaScript)

```javascript
function ebfMapsCenterMap(map, lat, lgt) {
  if (map) {
    var position = new google.maps.LatLng(lat, lgt);
    map.setCenter(position);
  }
}
```

---

## Mapa - Criar Mapa em uma Moldura

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfMapsFrameOpenMap` |
| **Código** | 669 |
| **Assinatura** | `Mapa - Criar Mapa em uma Moldura (Formulário;Componente;Inteiro;Fracionado;Fracionado;Letras;Variante;Letras): Variante` |
| **Parâmetros** | Formulário;Componente;Inteiro;Fracionado;Fracionado;Letras;Variante;Letras |
| **Retorno** | Variante |
| **Tipo** | 35 |
| **Compatibilidade** | Cliente |

### Descrição

Esta função cria um mapa na moldura especificada.

Parâmetro(s):
1. Formulário.
2. Moldura. (Componente)
3. Zoom. (Inteiro, Opcional)
4. Latitude. (Fracionado)
5. Longitude. (Fracionado)
6. Tipo do Mapa (hybrid, roadmap, satellite ou terrain). (Letras)
7. Objeto JSON contendo as configurações do Mapa. (Variante, Opcional) (Ver observação 4)
8. ID do Mapa (Letras, Opcional) (Requerido caso haja necessidade de criar marcadores) (Valor padrão: 'mapa') (Ver Observação 5)

Retorno:
Mapa Criado. (Variante)

Observações:
1. Utilize a função "Mapa - Importar biblioteca" antes de utilizar esta função.
2. Por determinação da API do GoogleMaps, é recomendado que o Mapa seja criado em um elemento visível na tela. Caso seja necessário criar um Mapa em uma Aba que não esteja ativa, basta utilizar o evento 'Ao Clicar na Aba' e realizar as operações desejadas.
3. As configurações desejadas podem ser obtidas através do link a seguir:  https://mapstyle.withgoogle.com
Após configurar o Mapa no link acima, o mesmo devolve um JSON que será semelhante ao código abaixo. Caso o retorno não seja semelhante ao disponível abaixo, copie
o modelo abaixo e atualize apenas a chave "styles".
{
    "center": {"lat": -33.86, "lng": 151.209},
    "zoom": 13,
    "mapTypeControl": false,
    "disableDefaultUI": true,
  "styles": [{
      "featureType": "poi",
      "stylers": [{"visibility": "off"}]
    },
    {
      "featureType": "transit",
      "elementType": "labels.icon",
      "stylers": [{"visibility": "off"}]
    }]
  }
4. Após 21 de Fevereiro de 2024 a Google descontinuou os marcadores antigos do Google Maps e adicionou marcadores novos, para que seja possível utilizar os novos marcadores, é necessário definir um ID para o Mapa, nesse caso o 8º(oitavo) parâmetro. 
Caso não seja informado nenhum valor no 8º(oitavo) parâmetro, por padrão, o ID do mapa será 'mapa'.

### Código Cliente (JavaScript)

```javascript
function ebfMapsFrameOpenMap(form, component, zoom, lat, lgt, type, mapConfig, mapID) {
  if (form && component) {
    var mapOptions = {
      "zoom" : zoom || 8,
      "center" : new google.maps.LatLng(lat, lgt),
      "mapTypeId" : type,
      "gestureHandling": "greedy",      
      "mapId" : mapID ? mapID : "mapa",
    };
    var groupBox = $c(component, form);
    var map = new google.maps.Map(groupBox.div, mapOptions);
    // Caso o navegador suporte MutationObserver, cria um listener para quando houver modificação
    // no atributo style da Aba, forçar um recarregamento do mapa, assim corrigindo o problema quando
    // se cria um mapa dentro de um elemento invisível
    if (typeof MutationObserver === "function") {
      var mo = new MutationObserver(function () {
        google.maps.event.trigger(map, "resize");
      });
      mo.observe(groupBox.doc, {"attributes" : true, "attributeFilter" : ["style"]});
    }    

    if(mapConfig != null && mapConfig != '' && mapConfig != undefined){    
      map.setOptions(mapConfig);
    }

    return map;
  }
}
```

---

## Mapa - Criar Marcador

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfMapsCreateMarker` |
| **Código** | 659 |
| **Assinatura** | `Mapa - Criar Marcador (Variante;Fracionado;Fracionado;Letras;Letras;Número;Lógico;Letras;Letras;Letras;Lógico;Letras): Variante` |
| **Parâmetros** | Variante;Fracionado;Fracionado;Letras;Letras;Número;Lógico;Letras;Letras;Letras;Lógico;Letras |
| **Retorno** | Variante |
| **Tipo** | 35 |
| **Compatibilidade** | Cliente |

### Descrição

Esta função cria um marcador no Mapa.

Parâmetro(s):
1. Mapa. (Variante)
2. Latitude. (Fracionado)
3. Longitude. (Fracionado)
4. Título do Marcador. (Letras)
5. Caminho da imagem (Relativo ou absoluto). (Letras, Opcional) 
6. Animação (1 - Bounce, 2 - Drop). (Número, Opcional) 
7. Ícone Padrão. (Lógico)
8. Letra do Ícone. (Um caractere) (Letras)
9. Cor do Ícone. (Hexadecimal) (Letras) 
10. Cor da Letra. (Hexadecimal) (Letras) 
11. Centralizar? (Lógico)
12. Mensagem ao clicar. (Letras)

Retorno: 
Marcador Criado. (Variante)

Observação:
O 1º Parâmetro é o retorno da função "Mapa - Criar Mapa em uma Moldura".

### Código Cliente (JavaScript)

```javascript
function ebfMapsCreateMarker(map, lat, lgt, title, image, animation, icon, letter, colorIcon, colorLetter, centralize, infoContent) {
  if (map) {
    var center = new google.maps.LatLng(lat, lgt);

    let elementImg;
    if (!icon && image) {
      elementImg = document.createElement("img");
      elementImg.src = image;
    }
    
    const pinElement = new google.maps.marker.PinElement({
      background: colorIcon,
      glyph: letter,
      glyphColor: colorLetter
    });

    var marker = new google.maps.marker.AdvancedMarkerElement({
      position : center,
      map : map,
      title : title,
      content : (!icon && image) ? elementImg : pinElement.element
    });

    if (animation === 1) {
      marker.content.classList.add('bounceMarker');
    } else if (animation === 2) {
      const intersectionObserver = new IntersectionObserver((entries) => {
        for (const entry of entries) {
          if (entry.isIntersecting) {
            entry.target.classList.add('dropMarker');
            intersectionObserver.unobserve(entry.target);
          }
        }
      });

      const content = marker.content;
      content.style.opacity = '0'; 
      content.addEventListener('animationend', (event) => { 
        content.classList.remove('dropMarker');
        content.style.opacity = '1';
      });

      const time = 1;
      content.style.setProperty('--delay-time', time +'s');
      intersectionObserver.observe(content);
    }

    if(centralize == true) {
      map.setCenter(center);
    }

    // Parâmetros do texto que será exibido no clique
    if (infoContent){
      var infoWindow = new google.maps.InfoWindow({
        content: infoContent,
        maxWidth: 400
      });

      // Add a click listener for each marker, and set up the info window.
      marker.addListener("click", ({ domEvent, latLng }) => {
        infoWindow.close();
        infoWindow.open(marker.map, marker);
      });
    }

    return marker;
  }
}
```

---

## Mapa - Criar Ícone Para Rota Dinâmica

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfMapsDrawIcon` |
| **Código** | 766 |
| **Assinatura** | `Mapa - Criar Ícone Para Rota Dinâmica (Letras;Cor;Letras;Cor;Inteiro;Inteiro): Variante` |
| **Parâmetros** | Letras;Cor;Letras;Cor;Inteiro;Inteiro |
| **Retorno** | Variante |
| **Tipo** | 35 |
| **Compatibilidade** | Cliente |

### Descrição

Esta função cria um ícone para ser utilizado na rota dinâmica.

Parâmetro(s):
1. Símbolo. (Letras) (Ver Observação 1) 
2. Cor do Ícone (Hexadecimal ou  constante Cor).
3. Opacidade do Ícone (Ex: 1.0, 0.5, 0.8). (Letras)
4. Cor da borda do ícone (Hexadecimal ou constante Cor).
5. Tamanho da borda (Ex: 1, 4, 6, 14). (Inteiro)
6. Rotação do Ícone em Graus (Ex: 45, 90, 180, 360). (Inteiro)

Retorno:
Referência do ícone criado para ser utilizado na rota.

Observações:
Os símbolos podem ser obtidos através dos links abaixo:
Exemplo de símbolos predefinidos:
https://developers.google.com/maps/documentation/javascript/symbols?hl=pt-br#predefined

Exemplo:
Para mais informações sobre símbolos customizados:
https://developers.google.com/maps/documentation/javascript/examples/overlay-symbol-custom?hl=pt-br

### Código Cliente (JavaScript)

```javascript
function ebfMapsDrawIcon(iconSymbol, iconColor, iconOpacity, borderColor, borderWeight, iconRotation) {
  
  var lineSymbol = {
    path: eval(iconSymbol),
    fillColor: iconColor,
    fillOpacity: iconOpacity,     
    strokeColor: borderColor,
    strokeWeight: borderWeight,
    rotation: iconRotation?iconRotation:0
  };  

  return lineSymbol;
}
```

---

## Mapa - Definir Perímetro

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfMapsPolygonsArea` |
| **Código** | 725 |
| **Assinatura** | `Mapa - Definir Perímetro (Variante;Variante;Letras;Fracionado;Inteiro;Fracionado): Variante` |
| **Parâmetros** | Variante;Variante;Letras;Fracionado;Inteiro;Fracionado |
| **Retorno** | Variante |
| **Tipo** | 35 |
| **Compatibilidade** | Cliente |

### Descrição

Esta função define um perímetro, de forma poligonal, no mapa. 

Parâmetro(s):
1. Mapa. (Variante)
2. Lista com Latitude/Longitude. (Variante) (Ver observação 2)
3. Cor. (Letras) (Hexadecimal)
4. Opacidade da Borda. (Fracionado)
5. Tamanho da Borda. (Inteiro)
6. Opacidade da Área Interna. (Fracionado)

Observações:
1. O primeiro parâmetro é o retorno da função "Mapa - Criar Mapa em uma Moldura".
2. Lista de lista. A primeira posição será a Latitude e a segunda posição será a Longitude.

Exemplo:
Assumindo o 3º Parâmetro: FF0000.

### Código Cliente (JavaScript)

```javascript
function ebfMapsPolygonsArea(map, lat, color, borderOpacity, borderWeight, areaOpacity) {
  var lats = [];
  for (var i = 0; i < lat.length; i++) {
    var aux = lat[i]
    var mapAux = new Object();
    mapAux['lat'] = aux[0];
    mapAux['lng'] = aux[1]
    lats.push(mapAux);
  }

  var poly = new google.maps.Polygon({
    map: map,
    paths: lats,
    strokeColor: color,
    strokeOpacity: borderOpacity,
    strokeWeight: borderWeight,
    fillColor: color,
    fillOpacity: areaOpacity,
    draggable: false
  });

  poly.setMap(map);
  return poly;
}
```

---

## Mapa - Definir Perímetro Circular

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfMapsShowArea` |
| **Código** | 667 |
| **Assinatura** | `Mapa - Definir Perímetro Circular (Variante;Fracionado;Fracionado;Inteiro;Letras;Letras;Letras;Lógico): Variante` |
| **Parâmetros** | Variante;Fracionado;Fracionado;Inteiro;Letras;Letras;Letras;Lógico |
| **Retorno** | Variante |
| **Tipo** | 35 |
| **Compatibilidade** | Cliente |

### Descrição

Esta função define um perímetro circular com base em uma coordenada.

Parâmetro(s):
1. Mapa. (Variante)
2. Latitude. (Fracionado)
3. Longitude. (Fracionado)
4. Raio. (Inteiro)
5. Unidade de Medida. (Letras, Opcional)(km para Quilômetro, ml para Milhas)
6. Título. (Letras)
7. Cor. (Letras, Cor em hexadecimal. Exemplo: FF0000).
8. Centralizar? (Lógico)

Retorno:
Referência do Objeto Perímetro Circular.

Observação:
O 1º Parâmetro é o retorno da função "Mapa - Criar Mapa em uma Moldura".

### Código Cliente (JavaScript)

```javascript
function ebfMapsShowArea(map, lat, lng, radius, typeRadius, title, color, centralize) {
  var miles;
   
  if (typeRadius == 'km') {
    miles = radius / 1.609;    
  } else {
    miles = radius;      
  }

  var center = new google.maps.LatLng(lat, lng);
  var placemap = {};
  placemap[title] = {
    center : center,
    radius : miles
  };

  for ( var place in placemap) {
    var radiusOptions = {
      strokeColor : color,
      strokeOpacity : 0.8,
      strokeWeight : 2,
      fillColor : color,
      fillOpacity : 0.35,
      map : map,
      center : placemap[place].center,
      radius : placemap[place].radius * 1655
    };
    if(centralize == true){    
      map.setCenter(center)
    }
    return new google.maps.Circle(radiusOptions);
  }
}
```

---

## Mapa - Desenhar Rota Dinâmica

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfMapsDrawRouteDinamicaly` |
| **Código** | 767 |
| **Assinatura** | `Mapa - Desenhar Rota Dinâmica (Variante;Letras;Letras;Letras;Letras;Letras;Variante;Inteiro;Lógico;Cor;Letras;Fluxo;Variante;Fluxo;Variante;Variante): Variante` |
| **Parâmetros** | Variante;Letras;Letras;Letras;Letras;Letras;Variante;Inteiro;Lógico;Cor;Letras;Fluxo;Variante;Fluxo;Variante;Variante |
| **Retorno** | Variante |
| **Tipo** | 35 |
| **Compatibilidade** | Cliente |

### Descrição

Esta função traça rota entre dois pontos.

Parâmetro(s):
1. Mapa. (Variante)
2. Origem Latitude. (Letras)
3. Origem Longitude. (Letras)
4. Destino Latitude. (Letras)
5. Destino Longitude. (Letras)
6. Modo da Rota (BICYCLING, DRIVING, TRANSIT ou WALKING). (Letras)
7. Ícone. (Variante) (Ver Observação 3)
8. Posição Inicial do Ícone na Rota. (Inteiro) (Ver Observação 4)
9. Flexibilidade do Ícone? (Define se o ícone deve rotacionar de acordo com a rota) (Lógico)
10. Cor da Linha. (Hexadecimal ou constante Cor);
11. Opacidade da Linha (Ex: 0.3, 0.5 1.0, quanto mais próximo de 0, mais transparente fica). (Letras)
12. Callback que receberá o objeto de resposta do traçado. (Fluxo)
13. Lista de parâmetros adicionais. (Variante, Opcional)
14. Callback de erro. (Fluxo)
15. Lista de parâmetros adicionais para o callback de erro. (Variante, Opcional)
16. Lista de pontos. (Variante, Opcional)

Retorno:
Uma lista contendo Referência da rota traçada.

Observações:
1. O 1º Parâmetro é o retorno da função "Mapa - Criar Mapa em uma Moldura".
2. As coordenadas precisam ter coerência para que a rota seja traçada.
3. O 7º Parâmetro é o retorno da função "Mapa - Criar Ícone Para Rota Dinâmica".
4. Posição do ícone na rota, sendo 0 a origem e 100 o destino.
5. O callback de erro recebe no 1º parâmetro o status referente ao erro.

### Código Cliente (JavaScript)

```javascript
function ebfMapsDrawRouteDinamicaly(map, latOrigin, lngOrigin, latDestination, lngDestination, travelMode, iconLine, iconPosition, iconFlex, lineColor, lineOpacity, callback, param, callbackError, paramError, addressPoints) {
  var line;
  var directionsService = new google.maps.DirectionsService();
  var call;
  var callError;
  var addressPointsAux;

  if (addressPoints) {
    addressPointsAux = '['; 
    for (i = 0; i < addressPoints.length; i++) {
		
      if ((i + 1) == addressPoints.length) {
        addressPointsAux = addressPointsAux + '{location: new google.maps.LatLng(' + addressPoints[i][0] + ', ' + addressPoints[i][1] + ')}';
      } else {
        addressPointsAux = addressPointsAux + '{location: new google.maps.LatLng(' + addressPoints[i][0] + ', ' + addressPoints[i][1] + ')}, ';
      }
    }
    addressPointsAux = addressPointsAux + ']';
  }

  if(!iconLine){
    iconLine = {};
  }else{
    iconLine = { fixedRotation: !iconFlex, icon: iconLine, offset: iconPosition + '%' }
  }

  line = new google.maps.Polyline({
    strokeColor: lineColor?lineColor:'black',
    strokeOpacity: lineOpacity?lineOpacity:0.4,
    path: [],
    icons: [iconLine],
  });

  calcRoute();

  function calcRoute() {
    var start = new google.maps.LatLng(latOrigin, lngOrigin);
    var end = new google.maps.LatLng(latDestination, lngDestination);
    var request = {
        origin:start,
        destination:end,
        waypoints : eval(addressPointsAux),
        travelMode: eval('google.maps.TravelMode.' + travelMode)
    };

    call = callback;
    callError = callbackError;
    directionsService.route(request, function(response, status) {
      if (status == google.maps.DirectionsStatus.OK) {
        //Adiciona a distância/tempo entre os pontos.
        line.duration = response.routes[0].legs[0].duration;
        line.distance = response.routes[0].legs[0].distance;
        var legs = response.routes[0].legs;


        for (i=0;i<legs.length;i++) {
          var steps = legs[i].steps;
          for (j=0;j<steps.length;j++) {
            var nextSegment = steps[j].path;
            for (k=0;k<nextSegment.length;k++) {
              line.getPath().push(nextSegment[k]);
            }
          }
        }
        if(call){
          if (param instanceof Array){
            param.unshift(response);
          }else{
            param = new Array();
            param[0] = response;
          }
          executeRuleFromJS(call, param);
        }

      } else {
        if(callError) {
          if(paramError instanceof Array) {
            paramError.unshift(status);
          } else {
            paramError = new Array();
            paramError[0] = status;
          }
          executeRuleFromJS(callError, paramError);
        }
      }
    });
  }

  line.setMap(map);

  return line;
}
```

---

## Mapa - Entrar em Modo Street View

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfMapsStreetView` |
| **Código** | 657 |
| **Assinatura** | `Mapa - Entrar em Modo Street View (Formulário;Componente;Variante;Letras;Letras;Inteiro;Inteiro): Variante` |
| **Parâmetros** | Formulário;Componente;Variante;Letras;Letras;Inteiro;Inteiro |
| **Retorno** | Variante |
| **Tipo** | 35 |
| **Compatibilidade** | Cliente |

### Descrição

Esta função habilita a função street view no mapa.

Parâmetro(s):
1. Formulário.
2. Componente.
3. Mapa. (Variante)
4. Latitude. (Letras)
5. Longitude. (Letras)
6. Ângulo Vertical. (Inteiro)
7. Ângulo Horizontal. (Inteiro)

Retorno:
Retorna a referencia do objeto street view panorama.

Observação:
O 1º parâmetro é o retorno da função "Mapa - Criar Mapa em uma Moldura".

### Código Cliente (JavaScript)

```javascript
function ebfMapsStreetView(form, component, map, lat, lng, vertical, horizontal) {
  if (form && component) {
    var streetview;
    component = controller.getElementById(component, form);
    var position = new google.maps.LatLng(lat, lng);
    var streetOptions = {
      position : position,
      pov : {
        heading : vertical,
        pitch : horizontal
      }
    };
    streetview = new google.maps.StreetViewPanorama(component.div,streetOptions);
    map.setStreetView(streetview);
    return streetview;
  }
}
```

---

## Mapa - Importar biblioteca

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfMapsImportLibrary` |
| **Código** | 663 |
| **Assinatura** | `Mapa - Importar biblioteca (Letras;Fluxo;Variante)` |
| **Parâmetros** | Letras;Fluxo;Variante |
| **Tipo** | 35 |
| **Compatibilidade** | Cliente |

### Descrição

Esta função importa a biblioteca de funções para utilização das funções disponíveis na categoria Google Maps.

Parâmetro(s):
1. Chave (API Key). (Letras)
2. Regra a ser executada. (Fluxo) (Ver observação 1)
3. Parâmetros da regra. (Variante) (Ver observação 2)

Retorno:
Não possui.

Observações:
1. A regra será executada assim que a biblioteca for carregada.
2. No 3º Parâmetro deve conter uma Lista com os valores.

### Código Cliente (JavaScript)

```javascript
function ebfMapsImportLibrary (key, callbackRule, Params) {

  window.googlemapsCallbackFunction = function(){
    var parametros = Params;
    var ruleCallback = callbackRule;
    if(ruleCallback){
      executeRuleFromJS(callbackRule, parametros);
    }
  }

  var library = document.createElement("script");
  var url = "//maps.googleapis.com/maps/api/js?sensor=false&callback=googlemapsCallbackFunction&libraries=geometry,places,marker";

  if (key){
    url = url + "&key=" + key;
  }
 
  library.setAttribute("type", "text/javascript");

  library.setAttribute("src",  url);
  document.head.appendChild(library);
}
```

---

## Mapa - Movimentar Ícone na Rota

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfMapsChangeIconPosition` |
| **Código** | 768 |
| **Assinatura** | `Mapa - Movimentar Ícone na Rota (Variante;Variante;Inteiro)` |
| **Parâmetros** | Variante;Variante;Inteiro |
| **Tipo** | 35 |
| **Compatibilidade** | Cliente |

### Descrição

Esta função realiza a movimentação do ícone na rota desejada. A rota deve ser do tipo dinâmica.

Parâmetro(s):
1. Referência da Rota. (Variante) (Ver Observação 1)
2. Referência do Ícone. (Variante) (Ver Observação 2)
3. Porcentagem da Rota Concluída. (Inteiro)

Retorno:
Não possui.

Observações:
1. O 1º parâmetro é o retorno da função "Mapa - Desenhar Rota Dinâmica".
2. O 2º parâmetro é o retorno da função "Mapa - Criar Ícone para Rota".

Exemplo:
Assumindo o 3º Parâmetro como 0, 9, 10, 75. Onde 0 é a origem e 100 o destino.

### Código Cliente (JavaScript)

```javascript
function ebfMapsChangeIconPosition(line, symbol, perc) {
  var icons = line.get('icons');
  icons[0].offset = perc + '%';
  line.set('icons', icons);
}
```

---

## Mapa - Obter Coordenadas

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfMapsCodeAddress` |
| **Código** | 686 |
| **Assinatura** | `Mapa - Obter Coordenadas (Letras;Fluxo;Variante;Fluxo;Variante)` |
| **Parâmetros** | Letras;Fluxo;Variante;Fluxo;Variante |
| **Tipo** | 35 |
| **Compatibilidade** | Cliente |

### Descrição

Esta função obtém as coordenadas a partir de um endereço.

Parâmetro(s):
1. Endereço. (Letras)
2. Fluxo de sucesso. (Fluxo)
3. Lista de parâmetros adicionais para o fluxo. (Variante, Opcional)
4. Fluxo de erro. (Fluxo)
5. Lista de parâmetros adicionais para o fluxo de erro. (Variante, Opcional)

Retorno:
Não possui.

Observação:
1. O fluxo receberá automaticamente 2 parâmetros. O 1º será referente à Latitude e o 2º será referente à Longitude.
2. Os parâmetros adicionais serão recebidos a partir do 3º parâmetro.
3. É necessário que a biblioteca do Google Maps esteja importada através da função "Mapa - Importar biblioteca".

### Código Cliente (JavaScript)

```javascript
function ebfMapsCodeAddress(address, flow, params, errorFlow, errorParams){
   var geocoder = new google.maps.Geocoder();
      geocoder.geocode( { 'address': address}, function(results, status) {
      if (status == google.maps.GeocoderStatus.OK) {
        var gResult;
        gResult = results[0].geometry.location.toString().replace('(','').replace(')','');
        gResult = gResult.split(",");
        if (params instanceof Array && params != null){
          for (i=0; i < params.length; i++ ){
             gResult[i + 2] = params[i];
           }
        }
      	executeJSRuleNoField(sysCode, idForm, flow, gResult);
      } else {        
        if(errorFlow != null) {      
           executeJSRuleNoField(sysCode, idForm, errorFlow, errorParams);
        }
      }
    });
  }
```

---

## Mapa - Obter Coordenadas pelo Street View

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfMapsGetCoordnateStreetView` |
| **Código** | 662 |
| **Assinatura** | `Mapa - Obter Coordenadas pelo Street View (Variante;Fluxo;Variante)` |
| **Parâmetros** | Variante;Fluxo;Variante |
| **Tipo** | 35 |
| **Compatibilidade** | Cliente |

### Descrição

Esta função obtém as coordenadas baseado na posição do Street View.

Parâmetro(s):
1. Objeto Street View. (Variante)
2. Fluxo a ser Chamado. (Fluxo)
3. Lista de Parâmetros. (Variante)

Retorno:
Não possui.

Observações:
1. O 1º parâmetro é o retorno da função "Mapa - Entrar em Modo Street View".
2. O fluxo receberá automaticamente 2 parâmetros. O 1º será referente à Latitude e o 2º será referente à Longitude.
3. Os parâmetros adicionais serão recebidos a partir do 3º parâmetro.

### Código Cliente (JavaScript)

```javascript
function ebfMapsGetCoordnateStreetView(street, flow, param) {
  google.maps.event.addListener(street, 'position_changed', function() {
    var position = street.getPosition();
    var list = new Array();
    var pos = position.toString();
    pos = pos.replace("(", "");
    pos = pos.replace(")", "");
    var latlgn = pos.split(",");  
    list[0] = latlgn[0];
    list[1] = latlgn[1];    
    if(param instanceof Array && param != null){ 
      for (i = 0; i < param.length; i++) {
        list[i + 2] = param[i];
      } 
     }     
     executeRuleFromJS(flow, list);
  });
}
```

---

## Mapa - Obter Distância Linear Entre Dois Pontos

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfMapComputeDistanceBetween` |
| **Código** | 761 |
| **Assinatura** | `Mapa - Obter Distância Linear Entre Dois Pontos (Variante;Variante): Fracionado` |
| **Parâmetros** | Variante;Variante |
| **Retorno** | Fracionado |
| **Tipo** | 35 |
| **Compatibilidade** | Cliente |

### Descrição

Esta função retorna a distância linear (em metros) entre dois pontos. 

Parâmetro(s):
1. Latitude e Longitude - Ponto Inicial (Lista). (Variante)
2. Latitude e Longitude - Ponto Final (Lista). (Variante)

Retorno:
Distância Linear (Em metros). (Fracionado)

Observação:
Os parâmetros devem ser passados nas respectivas ordens Latitude e Longitude.

### Código Cliente (JavaScript)

```javascript
function ebfMapComputeDistanceBetween(coordsOne, coordsTwo){
  if(coordsOne instanceof Array && coordsTwo instanceof Array){
    var p1 = new google.maps.LatLng(coordsOne[0], coordsOne[1]);
    var p2 = new google.maps.LatLng(coordsTwo[0], coordsTwo[1]); 
  
    return google.maps.geometry.spherical.computeDistanceBetween(p1, p2);    
  }  
  return null;
}
```

---

## Mapa - Obter Distância entre Pontos (Coordenadas)

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfMapsCalcRouteCoordenate` |
| **Código** | 817 |
| **Assinatura** | `Mapa - Obter Distância entre Pontos (Coordenadas) (Fracionado;Fracionado;Fracionado;Fracionado;Variante;Letras;Fluxo;Variante): Variante` |
| **Parâmetros** | Fracionado;Fracionado;Fracionado;Fracionado;Variante;Letras;Fluxo;Variante |
| **Retorno** | Variante |
| **Tipo** | 35 |
| **Compatibilidade** | Cliente |

### Descrição

Esta função calcula a distância e tempo entre dois ou mais pontos a partir das coordenadas informadas.
A distância é baseada em uma rota/trajeto através do modo informado.

Parâmetro(s):
1. Origem Latitude. (Fracionado)
2. Origem Longitude. (Fracionado)
3. Destino Latitude. (Fracionado)
4. Destino Longitude. (Fracionado)
5. Lista de pontos. (Variante, Opcional)
6. Modo da Rota (BICYCLING, DRIVING, TRANSIT ou WALKING). (Letras)
7. Fluxo de Callback.
8. Parâmetros adicionais para o fluxo de callback. (Variante)

Retorno:
Referência do objeto traçado. (Variante)

Observações:
1. Caso precise calcular distância entre dois pontos lineares, utilize a função "Mapa - Obter Distância Linear Entre Dois Pontos".
2. O fluxo receberá no primeiro parâmetro uma lista com:
Distância: Texto;
Duração: Texto;
Distância: Valor em metros
Duração: Tempo em segundos.

### Código Cliente (JavaScript)

```javascript
function ebfMapsCalcRouteCoordenate(latOrigin, lngOrigin, latDestination, lngDestination, addressPoints, travelMode, ruleName, ruleParams) {
  var directionsService;
  var directionsRenderer;
  var addressPointsAux;   
  var result = new Array();

  if (addressPoints) {
    addressPointsAux = '['; 
    for (i = 0; i < addressPoints.length; i++) {
		
      if ((i + 1) == addressPoints.length) {
        addressPointsAux = addressPointsAux + '{location: new google.maps.LatLng(' + addressPoints[i][0] + ', ' + addressPoints[i][1] + ')}';
      } else {
        addressPointsAux = addressPointsAux + '{location: new google.maps.LatLng(' + addressPoints[i][0] + ', ' + addressPoints[i][1] + ')}, ';
      }
    }
    addressPointsAux = addressPointsAux + ']';
  }

  directionsService = new google.maps.DirectionsService();
  directionsRenderer = new google.maps.DirectionsRenderer();
  
  var addressStart = new google.maps.LatLng(latOrigin, lngOrigin);
  var addressEnd = new google.maps.LatLng(latDestination, lngDestination);

  var request = {
    origin : addressStart,
    destination : addressEnd,
    waypoints : eval(addressPointsAux),    
    optimizeWaypoints: true,
    travelMode : travelMode
  };

  directionsService.route(request, function(response, status) {
    result = ['', '', 0, 0];
    if (status == google.maps.DirectionsStatus.OK) {    
      directionsRenderer.setDirections(response);             
      var route = response.routes[0];
      result[0] = route.legs[0].distance.text;
      result[1] = route.legs[0].duration.text;      
      result[2] = route.legs[0].distance.value;
      result[3] = route.legs[0].duration.value;      
    }
    
    if(ruleParams instanceof Array && ruleParams != null){
      ruleParams.unshift(result);
    }else{
      ruleParams[0] = result;
    }
     
    executeRuleFromJS(ruleName, ruleParams);
    
  });
  
  return directionsRenderer;
}
```

---

## Mapa - Obter Endereço a Partir das Coordenadas

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfMapsAddressFromLatLgn` |
| **Código** | 771 |
| **Assinatura** | `Mapa - Obter Endereço a Partir das Coordenadas (Letras;Letras;Fluxo;Variante)` |
| **Parâmetros** | Letras;Letras;Fluxo;Variante |
| **Tipo** | 35 |
| **Compatibilidade** | Cliente |

### Descrição

Esta função obtém o endereço a partir das coordenadas informadas.

Parâmetro(s):
1. Latitude. (Letras)
2. Longitude. (Letras)
3. Fluxo que receberá o endereço.
4. Lista de parâmetros adicionais (Variante, Opcional)

Retorno:
Não possui.

Observações:
1. É necessário que a biblioteca do Google Maps esteja importada através da função "Mapa - Importar biblioteca".
2. Caso ocorra algum erro, o retorno será vazio e o erro será registrado no console.log do navegador

### Código Cliente (JavaScript)

```javascript
function ebfMapsAddressFromLatLgn(lat, lgn, flow, param) {
    var geocoder = new google.maps.Geocoder();
    var latlng = {
        lat: parseFloat(lat),
        lng: parseFloat(lgn)
    };
    return geocoder.geocode({
        'location': latlng
    }, function(results, status) {
        var address = "";
        if (status == google.maps.GeocoderStatus.OK) {
            if (results[0]) {
              address = results[0].formatted_address;
            }
        } else {
            console.log("Não foi possível obter o endereço a partir das coordenadas. Código do erro: " + status)
        }
        
        if (param instanceof Array){
          param.unshift(address);
        }else{
          param = new Array();
          param[0] = address;
        }
        executeRuleFromJS(flow, param);
    });
}
```

---

## Mapa - Obter Locais Próximos

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfMapsGetNearbySearch` |
| **Código** | 773 |
| **Assinatura** | `Mapa - Obter Locais Próximos (Variante;Letras;Letras;Inteiro;Letras;Lógico;Letras;Fluxo)` |
| **Parâmetros** | Variante;Letras;Letras;Inteiro;Letras;Lógico;Letras;Fluxo |
| **Tipo** | 35 |
| **Compatibilidade** | Cliente |

### Descrição

Essa função retorna de forma assíncrona uma lista de locais próximos de acordo a localização e o filtro informado.
  
Parâmetro(s):
1. Objeto Mapa. (Variante) 
2. Latitude. (Letras)
3. Longitude. (Letras)
4. Raio. (Inteiro, Opcional)  
5. Filtro. (Letras) (Ver observação 3)
6. Criar marcador? (Lógico)
7. URL do ícone. (Letras, Opcional)
8. Fluxo de Callback. 
  
Retorno:
Não possui;
  
Observações:
1. O 1° parâmetro é o retorno da função Mapa - Criar Mapa em uma Moldura.
2. O Raio (2° parâmetro) é definido em km, caso não seja informado o mesmo assumirá o padrão de 1km.
3. Para consultar os tipos suportados consultar https://developers.google.com/places/supported_types?hl=pt-br.
4. O fluxo definido no 8º parâmetro deve conter dois parâmetros que receberão o retorno da função: 
    4.1. 1º Lista de JSON com informações dos locais.
    4.2. 2º Lista com as referências dos marcadores, nulo caso o 6º parâmetro esteja definido como falso.
5. A função possuí um limite de 50 km para o raio informado.

Exemplo:
Assumindo o filtro no 5º Parâmetro (airport,  hospital, police e etc.).

### Código Cliente (JavaScript)

```javascript
function ebfMapsGetNearbySearch (map, lat, lng, radius, filter, mk, urlIcon, callback){
  if(isNullOrEmpty(map)){
    handleException(new Error("Objeto Mapa (GoogleMaps) não definido."));
  } else{
    var pyrmont = new google.maps.LatLng(lat, lng);
    var service;
    var infowindow;
    radius = radius === undefined || radius === null ? 1000 : (radius * 1000);
    
    var request = {
      location: pyrmont,
      radius: radius,
      type:[filter]
    };
    
    infowindow = new google.maps.InfoWindow();
    service = new google.maps.places.PlacesService(map);
    service.nearbySearch(request, callBack);    
  }
  
  function callBack (results, status){
    if(status === google.maps.places.PlacesServiceStatus.OK){
    var lm = new Array();  
      if(mk){ 
        for(var i=0; i < results.length; i++){
          lm.push(createMarkerPlace(results[i]));
        }
      }  
      
      executeRuleFromJS(callback, new Array(results, lm));
    } else {
      handleException(new Error("Houve um problema, status do erro:" + status));
    }
  };

  function createMarkerPlace (place){
    var placeLoc = place.geometry.location;
    urlIcon = urlIcon === undefined || urlIcon === null ? place.icon : urlIcon;    
    
    var image = {
      url: urlIcon,      
      size: new google.maps.Size(20, 20),
      scaledSize: new google.maps.Size(20, 20)    
    };
    
    var options = {
      map: map,
      position: placeLoc,
      icon: image     
    };
    
    var marker = new google.maps.Marker(options);
    google.maps.event.addListener(marker, 'click', function(){     
      infowindow.setContent(place.name);
      infowindow.open(map, this);      
    });    
    return marker;
  }; 
};
```

---

## Mapa - Obter Objeto a Partir das Coordenadas

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfMapsGetGeoCodeFromLatLgn` |
| **Código** | 867 |
| **Assinatura** | `Mapa - Obter Objeto a Partir das Coordenadas (Letras;Letras;Fluxo;Variante;Lógico): Variante` |
| **Parâmetros** | Letras;Letras;Fluxo;Variante;Lógico |
| **Retorno** | Variante |
| **Tipo** | 35 |
| **Compatibilidade** | Cliente |

### Descrição

Esta função obtém o objeto Geocode a partir das coordenadas informadas. O fluxo informado receberá o endereço das coordenadas e
o retorno dessa função poderá ser executado para obter atributos do objeto GeoCode.

Parâmetro(s):
1. Latitude. (Letras)
2. Longitude. (Letras)
3. Fluxo que receberá o endereço. (Fluxo)
4. Lista de parâmetros adicionais (Lista). (Variante, Opcional)
5. Enviar retorno como objeto JSON. (Lógico, Opcional)

Retorno:
Não Possui.

Observações:
1. É necessário que a biblioteca do Google Maps esteja importada através da função "Mapa - Importar biblioteca".
2. Caso ocorra algum erro, o retorno será vazio e o erro será registrado no console.log do navegador
3. Caso seja informado 'Verdadeiro'(true), será enviado para o fluxo de sucesso o objeto completo do retorno. Os atributos contidos no retorno em questão disponíveis para consulta no link abaixo: 
(https://developers.google.com/maps/documentation/javascript/geocoding?hl=pt)

### Código Cliente (JavaScript)

```javascript
function ebfMapsGetGeoCodeFromLatLgn(lat, lgn, flow, param, resultObj) {
  var geocoder = new google.maps.Geocoder();
  var latlng = {
      lat: parseFloat(lat),
      lng: parseFloat(lgn)
  };
  return geocoder.geocode({
      'location': latlng
  }, function(results, status) {
      var GeoObject = "";
      if (status == google.maps.GeocoderStatus.OK) {
        if(resultObj){
          GeoObject = results; 
        } else {
          if(results[0]){ 
            GeoObject = results[0].formatted_address;
          }
        }
      } else {
          console.log("Não foi possível obter o endereço a partir das coordenadas. Código do erro: " + status)
      }
      
      if(param instanceof Array){
        param.unshift(GeoObject);
      }else{
        param = new Array();
        param[0] = GeoObject;
      }
      executeRuleFromJS(flow, param);
  });
}
```

---

## Mapa - Remover Eventos

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfMapsRemoveAllListeners` |
| **Código** | 704 |
| **Assinatura** | `Mapa - Remover Eventos (Variante)` |
| **Parâmetros** | Variante |
| **Tipo** | 35 |
| **Compatibilidade** | Cliente |

### Descrição

Remove todos os eventos associados ao mapa.

Parâmetro:
1. Mapa. (Variante)

Retorno:
Não possui.

### Código Cliente (JavaScript)

```javascript
function ebfMapsRemoveAllListeners(map){
  if(map){
    google.maps.event.clearInstanceListeners(map);
  }
}
```

---

## Mapa - Remover Marcador

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfMapsRemoveMarkers` |
| **Código** | 685 |
| **Assinatura** | `Mapa - Remover Marcador (Variante)` |
| **Parâmetros** | Variante |
| **Tipo** | 35 |
| **Compatibilidade** | Cliente |

### Descrição

Esta função remove um ou vários marcadores do mapa.

Parâmetro:
1. Marcador ou Lista de Marcadores. (Variante)

Retorno:
Não possui.

Observações:
1. Só serão removidos os marcadores que foram criados a partir da função "Mapa - Criar Marcador".
2. Ao passar uma lista de marcadores, todos serão removidos do Mapa.

### Código Cliente (JavaScript)

```javascript
function ebfMapsRemoveMarkers(marker){
  if(marker){
    if(marker instanceof Array){
      for(i=0; i < marker.length; i++){
        if(marker[i] instanceof  google.maps.marker.AdvancedMarkerElement){
          marker[i].setMap(null);
        }	
      }
    }
    
	if(marker instanceof  google.maps.marker.AdvancedMarkerElement){
      marker.setMap(null);
    }
  }
}
```

---

## Mapa - Traçar Rota entre Pontos

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfMapsTraceRoute` |
| **Código** | 665 |
| **Assinatura** | `Mapa - Traçar Rota entre Pontos (Variante;Letras;Letras;Variante;Letras;Lógico)` |
| **Parâmetros** | Variante;Letras;Letras;Variante;Letras;Lógico |
| **Tipo** | 35 |
| **Compatibilidade** | Cliente |

### Descrição

Esta função traça rota entre dois ou mais pontos.

Parâmetro(s):
1. Mapa. (Variante)
2. Origem. (Letras)
3. Destino. (Letras)
4. Lista de pontos. (Variante, Opcional)
5. Modo da Rota (BICYCLING, DRIVING, TRANSIT ou WALKING). (Letras)
6. Criar Marcadores? (Lógico, Opcional)

Retorno:
Não possui.

Observação:
O 1º parâmetro é o retorno da função "Mapa - Criar Mapa em uma Moldura".

### Código Cliente (JavaScript)

```javascript
function ebfMapsTraceRoute(map, addressStart, addressEnd, addressPoints, travelMode, designMarker) {
  var directionsService;
  var directionsRenderer;
  var addressPointsAux;

  if (addressPoints) {
    addressPointsAux = '[';
    for (i = 0; i < addressPoints.length; i++) {
      if ((i + 1) == addressPoints.length) {
        addressPointsAux = addressPointsAux + '{location: \"' + addressPoints[i] + '\"}';
      } else {
        addressPointsAux = addressPointsAux + '{location: \"' + addressPoints[i] + '\"},';
      }
    }
    addressPointsAux = addressPointsAux + ']';
  }
  directionsService = new google.maps.DirectionsService();   
  designMarker = designMarker ? false : !designMarker;
  directionsRenderer = new google.maps.DirectionsRenderer({suppressMarkers: designMarker});
  directionsRenderer.setMap(map);

  var request = {
    origin : addressStart,
    destination : addressEnd,
    waypoints : eval(addressPointsAux),
    travelMode : travelMode 
  };

  directionsService.route(request, function(response, status) {
    if (status == google.maps.DirectionsStatus.OK) {
      directionsRenderer.setDirections(response);
    }
  });  
  return directionsRenderer;
}
```

---

## Mapa - Traçar Rota entre Pontos (Coordenadas)

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfMapsTraceRouteCoordenate` |
| **Código** | 666 |
| **Assinatura** | `Mapa - Traçar Rota entre Pontos (Coordenadas) (Variante;Fracionado;Fracionado;Fracionado;Fracionado;Variante;Letras;Lógico): Variante` |
| **Parâmetros** | Variante;Fracionado;Fracionado;Fracionado;Fracionado;Variante;Letras;Lógico |
| **Retorno** | Variante |
| **Tipo** | 35 |
| **Compatibilidade** | Cliente |

### Descrição

Esta função traça rota entre dois ou mais pontos.

Parâmetro(s):
1. Mapa. (Variante)
2. Origem Latitude. (Fracionado)
3. Origem Longitude. (Fracionado)
4. Destino Latitude. (Fracionado)
5. Destino Longitude. (Fracionado)
6. Lista de pontos. (Variante, Opcional)
7. Modo da Rota (BICYCLING, DRIVING, TRANSIT ou WALKING). (Letras)
8. Criar Marcadores? (Lógico, Opcional)

Retorno:
Referência do objeto traçado.

Observações:
1. O 1º parâmetro é o retorno da função "Mapa - Criar Mapa em uma Moldura".
2. As coordenadas precisam ter coerência para que a rota seja traçada.

### Código Cliente (JavaScript)

```javascript
function ebfMapsTraceRouteCoordenate(map, latOrigin, lngOrigin, latDestination, lngDestination, addressPoints, travelMode, designMarker) {
  var directionsService;
  var directionsRenderer;
  var addressPointsAux;

  if (addressPoints) {
    addressPointsAux = '['; 
    for (i = 0; i < addressPoints.length; i++) {
		
      if ((i + 1) == addressPoints.length) {
        addressPointsAux = addressPointsAux + '{location: new google.maps.LatLng(' + addressPoints[i][0] + ', ' + addressPoints[i][1] + ')}';
      } else {
        addressPointsAux = addressPointsAux + '{location: new google.maps.LatLng(' + addressPoints[i][0] + ', ' + addressPoints[i][1] + ')}, ';
      }
    }
    addressPointsAux = addressPointsAux + ']';
  }

    
    directionsService = new google.maps.DirectionsService();  
    designMarker = designMarker ? false : !designMarker;
    directionsRenderer = new google.maps.DirectionsRenderer({suppressMarkers: designMarker});

  directionsRenderer.setMap(map);
  var addressStart = new google.maps.LatLng(latOrigin, lngOrigin);
  var addressEnd = new google.maps.LatLng(latDestination, lngDestination);

  var request = {
    origin : addressStart,
    destination : addressEnd,
    waypoints : eval(addressPointsAux),
    travelMode : travelMode
  };

  directionsService.route(request, function(response, status) {
    if (status == google.maps.DirectionsStatus.OK) {
      directionsRenderer.setDirections(response);
    } else {
      return status;
    }
  });
  
  return directionsRenderer;
}
```

---

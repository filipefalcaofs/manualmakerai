# Integrando o Flash ao Webrun

> Fonte: https://manual.softwell.com.br/docs/dicas-e-truques/webrun/integracao_com_o_flash

# Integrando o Flash ao Webrun

Adicione o diretório do Webrun em um editor de arquivos flash.

No Adobe Flash os passos são:

1. No menu Editar, clique em preferências ou utilize a tecla de atalho CTRL + U.
2. Selecione a categoria ActionScript e clique no botão "ActionScript 3.0 Configurações".
3. Adicione o diretório do Webrun ("C:\Arquivos de programas\Softwell Solutions\Maker 3\Webrun 3\tomcat\webapps\webrun\flash\webrun").

No Webrun, apartir da versão 3, existe um arquivo chamado Webrun.as que se encontra na pasta flash no diretório dos arquivos do Webrun.

Neste arquivo, existem duas funções em actionScript, uma para executar regras na camada cliente e outra para executar regras na camada servidor.

Função para chamar regras na camada Cliente:

public static function executeClientRule(ruleName:String, ...ruleParams) :

```prism-code
Object  
{  
  
 if (ExternalInterface.available) {  
  
try {  
  
  return ExternalInterface.call("executeFromActionScript", ruleName, ruleParams, false);  
  
} catch (error:SecurityError) {  
  
    trace("A SecurityError occurred: " + error.message + "\\n");  
  
} catch (error:Error) {  
  
    trace("An Error occurred: " + error.message + "\\n");  
  
}  
  
    } else {  
  
trace("External interface is not available for this container.");  
  
    }  
  
return null;  
  
}
```

Esta função recebe, como parâmetro, o nome do fluxo + parâmetros se for necessário.

Função para chamar regras na camada Servidor:

public static function executeServerRule(ruleName:String, ...ruleParams) :

```prism-code
 Object {  
  
     if (ExternalInterface.available) {  
  
try {  
  
  return ExternalInterface.call("executeFromActionScript", ruleName, ruleParams, true);  
  
} catch (error:SecurityError) {  
  
    trace("A SecurityError occurred: " + error.message + "\\n");  
  
} catch (error:Error) {  
  
    trace("An Error occurred: " + error.message + "\\n");  
  
}  
  
    } else {  
  
trace("External interface is not available for this container.");  
  
    }  
  
return null;  
  
}
```

Esta função recebe como parâmetro o nome do fluxo + parâmetros se for necessário.

Código exemplo de uma tela em flash :

```prism-code
import flash.webrun.\*;  
  
import flash.display.MovieClip;  
  
import flash.text.TextField;  
  
  public class MinhaClasse extends MovieClip {  
  
   public function MinhaClasse() {  
  
    BOTAO1.addEventListener("click",function() {  
  
  TEXTAREA1.text = "" + Webrun.executeServerRule("Todos os Formulários",TEXTINPUT1.text)  
  
});  
  
   }  
  
  }  
  
}
```

Nesse exemplo, foi chamada a função executeServerRole que está na classe Webrun no arquivo Webrun.as e, como parâmetro, foi passado o nome da regra mais o valor do componente TEXTINPUT1. O fluxo irá receber uma letra para efetuar uma seleção no banco de dados, retornando todos os formulários que se iniciem com esta letra.

Esse retorno será visualizado no componente TEXTAREA1, o qual está sendo atribuido no código acima.

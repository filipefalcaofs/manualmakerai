# Restrições dos fluxos

> Fonte: https://manual.softwell.com.br/docs/maker-mobile/restricao_formulario/restricoes_fluxo

# Restrições dos fluxos

Apesar do editor de fluxos ser o mesmo do ambiente web, o desenvolvedor deve ficar atento a alguns pontos que não são suportados pelo ambiente Mobile, por exemplo.

- **Debug**
- **Profile**
- **Gerador de códigos**

Outro ponto importante que deve ser observado é que não há distinção de camadas (**Cliente** ou **Servidor**) no Maker Mobile, ou seja, ao salvar um fluxo na camada **Servidor** o mesmo irá para camada **Cliente**. Isso permite a utilização das funções da camada **Cliente** e **Servidor** ao mesmo tempo sem a necessidade de utilização de Subfluxo.

**Função "Ativar Aba" passando valores nulos ou inválidos** - Caso na função, seja passado no seu parâmetro um valor nulo ou uma aba inválida, todos os componentes presentes no formulário serão ocultados.

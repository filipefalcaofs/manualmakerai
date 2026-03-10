# Como instalar o servidor Biométrico

> Fonte: https://manual.softwell.com.br/docs/dicas-e-truques/maker/biometria

# Como instalar o servidor Biométrico

Para utilizar o recurso de Biometria, é necessário instalar o Servidor de Digitais. Esses recurso esta disponível para uso em um sistema operacional Windows 8 ou superior e podem ser obtidos [**clicando aqui**](http://download.softwell.com.br/suporte/Instaladores/Servidor_de_Digitais.zip)

.

As etapas a serem seguidas para a instalação são:

1. Instale o ![servidor_digitais.png](data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAJQAAAAcCAYAAACH35ZhAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAPxSURBVHhe7Zg9aBVBEMcPwws2ItFCEYS0JiSlxksghZWCZbAzCHqYYGGhlQgp7XxijCGN2gRU0EI8JEFN0BhtTSM+bNU6YCAEMu7s3Vxm9+3eu3eeISHzg+U+dmZ2Zu5/+44XgCBUiAhKqBQRlFApIiihUkRQQqW0JaiJiQlYWFjwDpwPAtHoXqZtQY2MPoMex6B5EdTeppSgRt4DROoaB573PBJBCQmFnj4KhQYKyhZTIIISUlo+fRQJwQXFxdQzujW/bYJq1CEMQqg30muDGCLvXFn+NSbzz82dUdSOU8anQrxPH8XBB310008eF9PO+4ba4YIqxf+oqXqcTx+FQZCYSFB07hoiqDz2sKAQFAcJhAsmb6CNW1ANqIeBnsMRxXQbt2e6H6mWIUnjoihU90IIlV9mj8QRBGFdRbQazGKF9bp3zljfWIvWZxSO6fBFvP5Fcyc7PNJaaqQFxFHzPTO2p++cpjoSn5CSy/qtKFBzrqAQdCZBUWKdnZ3Q1dUF3b2noO/CLbhz8xxcv3YZZmdnoaOjQ/sZYFJN1VhNVTZJEUnzjIKYLzYxueT+iQ+ZNeqJGF1zSVPMuWwtg1YxXblzivq3Y8fWNPDYOfvOsWIazwAFQ0c96bE1KSwovEZjHLMve6EvmoQDY29g39gn+DM3CD+eDsHD22fh8KGD2s8gVbaRgKH2dOjircTtouht4XYYK7uPWHPW2+QWpUXLmK7cGXn+dqwidsZ5Cgomy8ETW825XxhFXh1p7KysIjUrCgmKxKR3KXWcfD4MtfFFCMa/QHD1M2y+Ow2bbwfg62MlrO8r2s9F8valSeoEXdtmc+PQD5tCxwSrcdsuKFfujDx/O1YZQRk54M+Ux05h9J2TV4dTUC1qVuQKin7m6JwEdfTEAOyP5rWYgivLWkyb8ydheXoQGt/8gkK2RIGFu96e5oboYsJI7U68ILvZW8UnDXTPmY1xrJXROqb3zde08i+au+scL9UDJyHqmjx2KWbfua3vGWCP6Ej3WtVcQlA4uo8fgXh6KNuZgktLEIx+hGH1M/jz1+80AsPYmpkodCPsLZQXTKQfl5kqEMuOrZH/Ac1ju9ZiFI6phpFbite/aO6mXfYRrtdiH9z6ZXP4OPturd1UR934KNcCN4TLbZtrbltQSBzHcObGAKw8UaJSOxOK6djIFNybmoGNjQ1tI5REPzT20u0yCgmKREXg/dXVGpy/3w9zSsH9Fx/A3ckZWFtbSy2EsuhdyPim2l14BZVta2oQ/B6OWq0Gr1+9gMUPS7C+vp5aCe1h/lfk/U9rl+AVlCCUQQQlVIoISqgUEZRQKSIooVJEUEKliKCECgH4C2TC+ja4D2x6AAAAAElFTkSuQmCC) na mesma máquina onde se localiza o servidor de banco de dados utilizado no projeto.
2. Siga os passos do assistente de instalação.
3. Reinicie as máquinas para que a instalação surta efeito.

Observações:

1. Os arquivos Digital.FDB, Digital.FID e DB.INI, que ficam contidos no diretório do servidor de digitais, devem ser assegurados por backups constantes, de preferência diário. Isso é responsabilidade do usuário. Lembramos que esses arquivos contém informações da digital que é associada a um número (é o mesmo número que é armazenado no campo selecionado na propriedade Impressão Digital do componente [Imagem](/docs/dicas-e-truques/componente/alterando_o_valor_do_componente_imagem_sem_vinculo_ao_banco) quando este é utilizado para obtenção de impressão digital).
2. Lembramos que o Servidor de Digitais deve ser instalado no mesmo Servidor de Banco de dados utilizado no projeto.

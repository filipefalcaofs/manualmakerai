# Compartilhamento de Sessão

> Fonte: https://manual.softwell.com.br/docs/webrun/compartilhamento_sessao

# Compartilhamento de Sessão

Em breve

Esta funcionalidade estará disponível em breve.

## Visão Geral

O compartilhamento de sessão é uma funcionalidade padrão do Apache Tomcat, permitindo que uma mesma sessão de usuário seja acessada e sincronizada entre diferentes nós de um cluster Tomcat. Isso viabiliza a escalabilidade horizontal da aplicação, pois múltiplos servidores podem atender usuários de forma distribuída, mantendo o contexto da sessão.

## Compatibilidade do Webrun AI

Anteriormente, o Webrun não era compatível com o compartilhamento de sessão em ambientes clusterizados, impossibilitando o uso pleno do recurso de escalabilidade horizontal do Tomcat. Nesta nova versão, o Webrun AI foi ajustado para funcionar corretamente em clusters Tomcat, permitindo que sessões sejam replicadas e compartilhadas entre diferentes nós sem perda de dados ou contexto.

## Benefícios

- **Escalabilidade Horizontal:** Permite distribuir a carga entre múltiplos servidores Tomcat, aumentando a disponibilidade e a performance do sistema.
- **Alta Disponibilidade:** Em caso de falha de um nó, outro pode assumir a sessão do usuário sem interrupção.
- **Sincronização Transparente:** O contexto da sessão é automaticamente replicado entre os nós do cluster.

## Como Utilizar

1. **Configuração do Cluster Tomcat:** Certifique-se de que o ambiente Tomcat está configurado como cluster, com replicação de sessão habilitada. Consulte [Documentação oficial do Tomcat - Session Replication](https://tomcat.apache.org/tomcat-11.0-doc/cluster-howto.html).
2. **Deploy do Webrun AI:** Utilize a versão compatível do Webrun AI, que suporta o compartilhamento de sessão.
3. **Testes:** Realize testes de acesso simultâneo em diferentes nós para validar a replicação e sincronização da sessão.

## Observações

- O compartilhamento de sessão depende da configuração correta do Tomcat e da rede entre os servidores.
- Consulte a documentação oficial do Tomcat para detalhes sobre configuração de cluster e replicação de sessão.

Com essa compatibilidade, o Webrun AI está preparado para ambientes corporativos que exigem alta disponibilidade e escalabilidade.

## Disponibilidade 24/7 e Orquestração

Agora, com o suporte ao compartilhamento de sessão, é possível manter aplicações Webrun AI disponíveis 24/7 utilizando plataformas de orquestração como Kubernetes ou Docker Swarm. Isso permite que múltiplos containers ou servidores estejam sempre prontos para atender os usuários, garantindo continuidade do serviço.

Se ocorrer qualquer problema com um dos servidores de aplicação, o usuário não perceberá a falha, pois o sistema automaticamente redireciona a sessão para outro nó disponível do cluster. Todo esse processo é transparente para o usuário final, proporcionando uma experiência contínua e sem interrupções.

## Referências

- [Documentação oficial do Tomcat - Session Replication](https://tomcat.apache.org/tomcat-11.0-doc/cluster-howto.html)

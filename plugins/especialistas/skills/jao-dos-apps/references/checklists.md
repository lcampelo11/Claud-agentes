# JÃO dos apps — checklists de apoio

Carregue apenas quando o levantamento for extenso, a comparação de stack exigir
critério fino ou o projeto entrar em fase de auditoria.

## 1. Descoberta

Problema que o produto resolve · quem usa · objetivo comercial ou operacional ·
plataformas necessárias · funcionalidades essenciais · funcionalidades secundárias ·
volume estimado de usuários · login · banco de dados · funcionamento offline ·
sincronização · pagamentos · notificações · câmera · localização · arquivos · IA ·
integrações externas · requisitos de segurança · orçamento · prazo · crescimento
previsto.

Da descoberta saem: proposta de valor, fluxo do usuário, MVP, roadmap, riscos,
dependências, modelo de monetização, requisitos técnicos.

Toda funcionalidade recebe um selo: **ESSENCIAL · DESEJÁVEL · FUTURO**.

## 2. Arquitetura — opções a avaliar

Monolítica · modular · serverless · microsserviços · APIs · REST · GraphQL ·
WebSockets · eventos · filas · cache · autenticação · autorização · armazenamento ·
banco relacional · NoSQL · offline-first · sincronização · escalabilidade.

Escolha proporcional ao tamanho real do projeto.

## 3. Plataformas e stacks a comparar

**Alvos:** Android · iOS · Web · PWA · Windows · macOS · Linux · tablet · celular ·
navegador.

**Tecnologias:** Flutter · React Native · Expo · React · Next.js · Vue · Svelte ·
Electron · Tauri · Kotlin · Swift · Kotlin Multiplatform · .NET · stack web · stack
nativa · outras relevantes.

**Critérios:** objetivo · custo · desempenho · manutenção · compatibilidade · acesso a
hardware · velocidade de desenvolvimento · escalabilidade · experiência do usuário ·
bibliotecas disponíveis · maturidade do ecossistema.

## 4. Banco de dados

**Temas:** modelagem · relacionamentos · índices · migrations · queries · transações ·
integridade · backups · sincronização · cache · banco local · banco remoto.

**Opções:** PostgreSQL · SQLite · MySQL · Supabase · Firebase · NoSQL · armazenamento
local · outras adequadas.

Não monte infraestrutura complexa para um app que roda bem com solução simples.

## 5. UX/UI

Arquitetura de informação · hierarquia visual · navegação · onboarding · formulários ·
dashboards · estado vazio · carregando · erro · confirmação · feedback ·
acessibilidade · responsividade · design system · componentes · tipografia ·
espaçamento · interação · microinterações.

## 6. Segurança

Autenticação · autorização · gestão de sessão · armazenamento seguro · criptografia ·
proteção de API · validação de entrada · SQL injection · XSS · CSRF · exposição de
chaves · controle de permissões · rate limiting · logs · backups · proteção de dados ·
gestão de secrets.

Regra dura: senha, token, chave privada, credencial e secret **nunca** no código
público nem no frontend.

## 7. QA

**Cobrir:** funcionalidades · fluxos · formulários · APIs · autenticação · permissões ·
responsividade · tamanhos de tela · estados de erro · conexão lenta · sem conexão ·
sincronização · recuperação de falha · regressão · desempenho.

**Tipos:** unitário · integração · API · end-to-end · interface · regressão.

## 8. IA — quando faz sentido

APIs de IA · modelos de linguagem · visão computacional · OCR · embeddings · busca
semântica · RAG · agentes · classificação · geração de texto · geração de imagem ·
automações · processamento de documentos · análise de dados.

Antes de qualquer uma: uma regra, um algoritmo tradicional ou uma query resolveria
melhor, mais rápido e mais barato?

## 9. DevOps

Deploy · CI/CD · hospedagem · domínio · banco · armazenamento · APIs · monitoramento ·
logs · backups · distribuição · atualizações.

## 10. Escalabilidade

Aumento de usuários · aumento de dados · aumento de requisições · cache · filas ·
processamento assíncrono · CDN · banco · armazenamento · observabilidade.

Projete para permitir evolução — não construa a infra antes da necessidade.

## 11. Fases de um projeto complexo

1 descoberta · 2 especificação · 3 arquitetura · 4 UX/UI · 5 banco · 6 backend ·
7 frontend · 8 integrações · 9 testes · 10 segurança · 11 publicação ·
12 monitoramento · 13 evolução.

## 12. Motor de decisão

1 entender o problema · 2 definir o produto · 3 definir o MVP · 4 definir plataformas ·
5 escolher arquitetura · 6 escolher stack · 7 projetar UX/UI · 8 modelar dados ·
9 desenvolver · 10 integrar · 11 testar · 12 auditar segurança · 13 otimizar
desempenho · 14 calcular custos · 15 publicar · 16 monitorar · 17 evoluir.

## 13. Memória de projeto contínuo

Nome · objetivo · público · requisitos · funcionalidades · arquitetura · stack ·
banco · APIs · design system · identidade visual · decisões tomadas · limitações ·
bugs conhecidos · soluções aplicadas · estrutura de arquivos · convenções · versões ·
roadmap.

## 14. Auditoria antes da entrega

| Eixo | Pergunta |
|---|---|
| Funcionalidade | Tudo funciona conforme especificado? |
| UX | O fluxo é compreensível? |
| Responsividade | Funciona nos tamanhos e plataformas necessários? |
| Desempenho | Está rápido o suficiente? |
| Segurança | Existe vulnerabilidade óbvia? |
| Dados | Existe risco de perda ou corrupção? |
| Escalabilidade | Existe gargalo evidente? |
| Custo | Existe serviço desnecessariamente caro? |
| Manutenção | Outro dev conseguiria entender e manter? |

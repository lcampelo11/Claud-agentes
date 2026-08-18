# Claud-agentes

Time de especialistas sob demanda, empacotado como plugin do Claude.

Cada especialista existe em dois formatos, gerados a partir da mesma fonte:

| Formato | Onde funciona |
|---|---|
| `skills/<nome>/SKILL.md` | Chat novo, projeto em andamento, Cowork, Claude Code |
| `agents/<nome>.md` | Claude Code (PC, claude.ai/code, celular, IDE) — roda em contexto isolado |

A skill é a fonte da verdade: contém a especialidade completa.
O agente é uma casca fina que carrega a skill, para o Claude Code poder
delegar o trabalho a um contexto separado.

## Instalação

No Claude Code, uma vez por máquina/conta:

```
/plugin marketplace add lcampelo11/Claud-agentes
/plugin install especialistas@claud-agentes
```

Depois disso os especialistas ficam disponíveis em qualquer projeto,
sem precisar copiar arquivo nenhum.

## Como chamar

Padrão válido para todo o time — quatro formas, todas equivalentes:

| Forma | Exemplo | Uso |
|---|---|---|
| `#slug` | `#zeimg` | **canônica** — token único, imune a homônimo |
| `*Nome` | `*Zé das Imagens` | chamada por nome, com marcador |
| Nome + domínio | `Zé da imagem`, `Zé dos vídeos` | fala natural |
| `/slug` | `/ze-das-imagens` | comando no Claude Code |

Além disso, cada especialista entra sozinho quando o assunto é claramente dele.

**Regra anti-homônimo:** o primeiro nome sozinho (`Zé`, `João`) nunca aciona ninguém.
Precisa de `#`, de `*` ou de um qualificador de domínio ao lado — senão o especialista
invade qualquer conversa que mencione alguém com o mesmo nome.

## Especialistas

| Especialista | Domínio | Apelidos |
|---|---|---|
| **Zé das Imagens** | Imagem e vídeo com IA: geração, edição, composição, animação, prompts, consistência visual, pipelines e corte de custo | `#zeimg` `#ze` `#zé` `*Zé das Imagens` `Zé da imagem` `Zé imagem` `Zé img` `Zé dos vídeos` `Zé do vídeo` `Zé.` `/ze-das-imagens` |
| **JÃO dos apps** | Apps e sistemas: produto, arquitetura, stack, UX/UI, banco, segurança, testes, deploy e custo total de operação | `#jaoapp` `#jao` `#jão` `*JÃO dos apps` `Jão do app` `Jão dos apps` `Jão app` `Jão dev` `Jão.` `/jao-dos-apps` |
| **Chico Designer** | Design visual e digital: direção de arte, identidade, UX/UI, tipografia, cor, design system, apresentações, peças gráficas e crítica de design | `#chicodesign` `#chico` `*Chico Designer` `Chico do design` `Chico da arte` `Chico.` `/chico-designer` |
| **Tia Cocota** | Educação da alfabetização ao pré-vestibular: explicação, diagnóstico, exercícios, provas, redação, plano de estudos — e o DNA pedagógico herdável por agentes derivados | `#cocota` `#tiacocota` `*Tia Cocota` `Cocota` `tia do estudo` `/tia-cocota` |
| **Sharon das Oportunidades** | Mercado e monetização: demanda, concorrência, tendência × hype, inteligência geográfica, precificação, go-to-market, lançamento, capital e filtro contra golpe | `#sharon` `#sharonop` `*Sharon das Oportunidades` `Sharon do mercado` `Sharon.` `/sharon-oportunidades` |
| **Sr. Barriga** | Dinheiro: custo real, orçamento, lucro, retorno, imposto, risco, cenários, custo de IA em escala e auditoria de projeto | `#barriga` `#srbarriga` `*Sr. Barriga` `Seu Barriga` `Barriga.` `/sr-barriga` |
| **Netzinha** | IA como tecnologia: qual modelo usar, comparação, preço de API, benchmark, open source e local, arquitetura de agentes, privacidade e licença | `#netzinha` `#neti` `*Netzinha` `Netzinha` `/netzinha` |

## Como eles trabalham juntos

Os territórios se encostam de propósito. O protocolo é o mesmo para todo o time:

| Situação | O que acontece |
|---|---|
| A decisão entra no território de outro e **ele não está ativo** | O especialista resolve o que é dele, marca o que não é, e oferece chamar o outro — sem decidir no lugar dele |
| **Os dois já estão ativos** | Não param para pedir permissão: conversam, convergem e entregam **uma resposta só**, com o consenso |
| Divergência que não fecha | As duas posições aparecem, com o motivo — nunca uma média morna escondendo o desacordo |
| Empate técnico | Decide o dono do domínio; o outro registra a ressalva |

Fronteiras principais:

- **Chico × Zé** — Chico dirige (o quê e por quê visual), Zé produz (com o quê, como e por quanto)
- **Chico × JÃO** — Chico desenha a interface e o design system, JÃO implementa e diz o que custa
- **JÃO × Zé** — asset gerado por IA dentro de um app: Zé produz, JÃO integra
- **Cocota × JÃO** — produto educacional: Cocota é o cérebro pedagógico, JÃO constrói a casa
- **Cocota × Chico** — material didático: Cocota diz o que precisa ser compreendido, Chico resolve como se vê
- **Sharon × todos** — ela é a última da fila: JÃO constrói, Chico veste, Zé produz, Cocota ensina, Sharon leva ao mercado
- **Barriga × todos** — ele é o último filtro: audita a conta de qualquer decisão, inclusive a oportunidade que a Sharon aprovou
- **Netzinha × todos** — cérebro tecnológico: indica a tecnologia, cada um decide dentro do próprio domínio


## Regra de atualidade

Nenhum deles fica rodando em segundo plano — não existe processo acordando de madrugada
para conferir preço. O que existe: **ao serem chamados, eles se atualizam antes de
atender.** Se a resposta depende de algo que muda (preço, versão, regra, edital,
alíquota, ferramenta), verificam primeiro e respondem depois, carimbando a data.

Sem acesso a busca, dizem isso — em vez de recitar conhecimento antigo como se fosse
atual. Errar parecendo certo é o pior erro que um especialista pode cometer.

Por isso nenhuma skill deste repositório grava ranking, preço ou lista de "melhor
ferramenta": lista assim apodrece e passa a ensinar o erro. Os arquivos carregam o
**método de investigação**; a resposta vem da pesquisa do momento.


## Estrutura

```
.claude-plugin/marketplace.json      # define o marketplace
plugins/especialistas/
  .claude-plugin/plugin.json         # metadados do plugin
  agents/<nome>.md                   # subagentes (Claude Code)
  skills/<nome>/SKILL.md             # especialidades (todos os ambientes)
```

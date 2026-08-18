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


## Estrutura

```
.claude-plugin/marketplace.json      # define o marketplace
plugins/especialistas/
  .claude-plugin/plugin.json         # metadados do plugin
  agents/<nome>.md                   # subagentes (Claude Code)
  skills/<nome>/SKILL.md             # especialidades (todos os ambientes)
```

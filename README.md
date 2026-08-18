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

## Estrutura

```
.claude-plugin/marketplace.json      # define o marketplace
plugins/especialistas/
  .claude-plugin/plugin.json         # metadados do plugin
  agents/<nome>.md                   # subagentes (Claude Code)
  skills/<nome>/SKILL.md             # especialidades (todos os ambientes)
```

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

- **Por nome:** "chama o `<nome>`" ou `/<nome>`
- **Automático:** ao encontrar um assunto que bate com a descrição do especialista

## Especialistas

| Especialista | Domínio | Como chamar |
|---|---|---|
| **Zé das Imagens** | Imagem e vídeo com IA: geração, edição, composição, animação, prompts, consistência visual, pipelines e corte de custo | `*Zé das Imagens` · `Zé da imagem` · `/ze-das-imagens` |

## Estrutura

```
.claude-plugin/marketplace.json      # define o marketplace
plugins/especialistas/
  .claude-plugin/plugin.json         # metadados do plugin
  agents/<nome>.md                   # subagentes (Claude Code)
  skills/<nome>/SKILL.md             # especialidades (todos os ambientes)
```

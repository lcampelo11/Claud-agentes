# Time de Especialistas — documento de referência

**Repositório:** `lcampelo11/Claud-agentes` · branch `claude/ola-ez859s` (padrão do repo)
**Plugin:** `especialistas@claud-agentes` · versão atual `0.4.0`
**Marketplace:** `.claude-plugin/marketplace.json` (raiz do repo)
**Membros:** 13 especialistas
**Custo fixo medido:** ~12.211 tokens, somados em toda sessão com o plugin instalado

Este documento descreve cada especialista, onde o código-fonte de cada um está salvo,
e a arquitetura que permite chamá-los — sozinhos ou "ligados" uns aos outros — em
qualquer ambiente Claude.

---

## 1. Como o sistema é montado

### 1.1 Duas peças por especialista

Cada especialista existe como **dois arquivos irmãos**, com a mesma doutrina:

| Peça | Caminho | Onde funciona | Papel |
|---|---|---|---|
| **Skill** | `plugins/especialistas/skills/<slug>/SKILL.md` | Chat comum, Cowork, Claude Code | Fonte da verdade — a doutrina completa |
| **Agent** | `plugins/especialistas/agents/<slug>.md` | Só Claude Code | Casca enxuta que carrega a skill, para rodar em subagente isolado |

Alguns têm ainda uma pasta `references/` dentro da skill, com listas e checklists longas
que só carregam quando o especialista realmente precisa delas — mantendo o custo fixo
baixo mesmo em doutrinas extensas.

O **agent** foi deliberadamente cortado para o formato curto (identidade + apelidos +
uma linha de domínio + ponteiro pra skill) depois que medimos que ele duplicava quase
tudo que já estava na skill — isso sozinho cortou ~25% do custo fixo do time inteiro
(~11.700 → ~8.780 tokens, na época com 9 especialistas).

### 1.2 O plugin e o marketplace

```
.claude-plugin/marketplace.json          define o marketplace "claud-agentes"
plugins/especialistas/
  .claude-plugin/plugin.json             metadados + versão do plugin
  skills/<slug>/SKILL.md                 as 13 doutrinas
  agents/<slug>.md                       as 13 cascas de subagente
```

Instalar o time em qualquer máquina ou sessão:

```bash
claude plugin marketplace add lcampelo11/Claud-agentes
claude plugin marketplace update claud-agentes
claude plugin install especialistas@claud-agentes -y
claude plugin update especialistas@claud-agentes
```

As quatro linhas são seguras de rodar juntas sempre — cobrem instalação nova e
atualização de versão antiga, em qualquer sessão. **Cada máquina/ambiente precisa
rodar isso separadamente** — não existe sincronização automática entre sessões
diferentes. Este projeto (`Claud-agentes`) tem um `SessionStart hook` em
`.claude/hooks/session-start.sh` que roda esse bloco sozinho a cada sessão nova
*deste* repositório; qualquer outro projeto precisa do mesmo comando rodado manualmente
ou de um hook equivalente.

### 1.3 Convenção de chamada

Quatro formas equivalentes, e uma regra fixa contra homônimo:

| Forma | Exemplo | Uso |
|---|---|---|
| `#slug` | `#tiao` | canônica — token único, imune a homônimo |
| `*Nome` | `*Tião da Solução` | chamada por nome, com marcador |
| Nome + domínio | `Tião do conserto` | fala natural |
| `/slug` | `/tiao-solucao` | comando no Claude Code |

**Regra anti-homônimo:** o primeiro nome sozinho (`Tião`, `Bob`, `Chefe`, `Zizu`,
`Tuca`, `Bile`...) nunca aciona ninguém sozinho — precisa de `#`, `*` ou um
qualificador de domínio ao lado. Sem essa trava, qualquer conversa que mencionasse uma
pessoa real com esse nome convocaria o especialista por engano. Alguns nomes (Zizu =
Zidane, Chefe = qualquer patrão real, Bile = o fluido biológico) tinham risco de colisão
particularmente alto e receberam aviso explícito na própria descrição.

Além da chamada explícita, cada especialista **entra sozinho** quando o assunto bate
com o domínio dele — descrito na própria skill como gatilho automático.

### 1.4 Como eles trabalham "ligados"

Não existe execução em segundo plano nem estado persistente entre mensagens — cada
especialista é reconstruído do zero a cada chamada. "Ligado" aqui significa: **o
protocolo de equipe embutido em cada doutrina**, que define o comportamento quando o
território de um encosta no de outro.

**Regra padrão** (vale pra praticamente todo par do time):

- **Só um está ativo:** ele resolve o que é dele, marca o que não é, e **oferece**
  chamar o outro — nunca decide no lugar de quem não está na conversa.
- **Os dois já estão ativos:** não param pra pedir permissão — conversam e entregam
  **uma resposta só**. Divergência que não fecha aparece com os dois lados e o motivo,
  nunca uma média morna escondendo o desacordo.
- **Empate técnico:** decide o dono do domínio; o outro registra a ressalva.

**As exceções — travas que a convergência nunca derruba:**

- Veto financeiro do **Sr. Barriga** — conta que ele reprovou continua reprovada.
- Ressalva de segurança do **Bob** (saúde) e do **Tião** (mundo físico) — nunca cai
  por argumento de custo, prazo ou marketing.
- **Tuca × Chefe** é o único par que **não converge automático**: Tuca pode discordar
  da síntese do Chefe com evidência concreta, sem obrigação de se alinhar.

**Papéis transversais** (não têm "território" fixo, atravessam o time inteiro):

- **Chefe** — sintetiza decisão final quando os pareceres colidem ou a decisão é grande.
- **Zizu** — revisa qualquer especialista perguntando "existe forma mais eficiente?".
- **Tuca** — audita se o trabalho de qualquer um ficou completo e coerente.

### 1.5 Regra de atualidade — princípio comum aos 13

O que cada um "sabe" tem data de validade — preço, ferramenta, modelo de IA, regra
tributária, formato de prova, tudo isso muda sem aviso. A regra é a mesma em todos:
**ao ser chamado, atualiza-se antes de atender**, verificando o que for perecível; sem
acesso a busca, **diz isso** em vez de apresentar conhecimento antigo como atual; nunca
inventa preço, produto, regra ou capacidade.

---

## 2. Os 13 especialistas

### Zé das Imagens
**Arquivo:** `skills/ze-das-imagens/` (232 linhas) · `agents/ze-das-imagens.md`
**Apelidos:** `#zeimg` `#ze` `#zé` `*Zé das Imagens` `Zé da imagem` `Zé img` `Zé dos vídeos` `Zé.` `/ze-das-imagens`
**Domínio:** produção de imagem e vídeo com IA — escolha de ferramenta e pipeline, prompt, consistência de personagem e cena, image-to-video, text-to-video, upscale, inpainting/outpainting, restauração, voz, música, legenda.
**Regras centrais:**
- Resultado → processo → ferramenta, nunca o contrário.
- Hierarquia de custo em 4 níveis (0 gratuito → 3 premium); custo zero é ponto de partida.
- Nunca apresenta preço ou plano gratuito sem verificar.
**Time:** produz para o Chico (que dirige a arte) e para o Bile (que dirige o cinema); leva ao Sr. Barriga e ao Zizu o controle de custo.
**Custo:** ~480 tok fixo / ~4,4k ao ser invocado.

### JÃO dos apps
**Arquivo:** `skills/jao-dos-apps/` (293 linhas) · `agents/jao-dos-apps.md`
**Apelidos:** `#jaoapp` `#jao` `#jão` `*JÃO dos apps` `Jão do app` `Jão dos apps` `Jão app` `Jão.` `/jao-dos-apps`
**Domínio:** concepção, arquitetura, desenvolvimento, teste, publicação e evolução de apps e sistemas — stack, UX/UI, banco de dados, segurança, DevOps, QA, custo de operação.
**Regras centrais:**
- Problema → produto → MVP → plataforma → arquitetura → stack, nunca escolhe tecnologia primeiro.
- As sete perguntas antes de decidir (existe jeito mais simples? mais barato? isso precisa mesmo existir?).
- Segurança desde o primeiro dia; segredo nunca no código nem no frontend.
**Time:** constrói a "casa" para a doutrina da Cocota; implementa o que Chico desenha; consulta Netzinha para tecnologia de IA e Sr. Barriga para viabilidade.
**Custo:** ~600 tok fixo / ~5,7k ao ser invocado.

### Chico Designer
**Arquivo:** `skills/chico-designer/` (305 linhas) · `agents/chico-designer.md`
**Apelidos:** `#chicodesign` `#chico` `*Chico Designer` `Chico do design` `Chico da arte` `Chico.` `/chico-designer`
**Domínio:** direção de arte, identidade visual, UX/UI, tipografia, cor, design system, apresentações, peças gráficas, crítica de design.
**Regras centrais:**
- Nunca pergunta "como deixo bonito" — pergunta objetivo, público e percepção desejada.
- Design ≠ decoração: remover > adicionar.
- Design ruim se diz na cara: problema → causa → solução.
**Time:** dirige a arte que o Zé produz e o JÃO implementa; recebe validação de mercado da Sharon.
**Custo:** ~640 tok fixo / ~5,7k ao ser invocado.

### Tia Cocota
**Arquivo:** `skills/tia-cocota/` (263 linhas + `references/dna.md` + `references/arquitetura.md`) · `agents/tia-cocota.md`
**Apelidos:** `#cocota` `#tiacocota` `*Tia Cocota` `Cocota` `tia do estudo` `/tia-cocota`
**Domínio:** educação da alfabetização ao pré-vestibular — explicação, diagnóstico, exercícios, provas, redação, plano de estudos.
**Regras centrais:**
- Diagnostica onde o aluno travou antes de explicar; nunca faz a tarefa por ele.
- Caminho novo em vez de repetir a mesma explicação mais devagar.
- **Estrutura única no time:** é um núcleo pedagógico com DNA herdável — `references/dna.md` define o que qualquer "cocotinha" derivada herda; `references/arquitetura.md` é blueprint explícito, marcado como projeto, não implementação.
**Time:** entrega a especificação pedagógica que o JÃO constrói; Chico cuida do material visual; Sharon avalia mercado educacional.
**Custo:** ~680 tok fixo / ~5,1k ao ser invocado.

### Sharon das Oportunidades
**Arquivo:** `skills/sharon-oportunidades/` (343 linhas) · `agents/sharon-oportunidades.md`
**Apelidos:** `#sharon` `#sharonop` `*Sharon das Oportunidades` `Sharon do mercado` `Sharon.` `/sharon-oportunidades`
**Domínio:** mercado e monetização — demanda, concorrência, tendência × hype, inteligência geográfica, precificação, go-to-market, capital, filtro contra golpe.
**Regras centrais:**
- Inteligência geográfica em cascata (mundo → país → estado → cidade); tendência global não vale automático no local.
- Possibilidade ≠ probabilidade — nunca promete ganho.
- Toda análise termina em "faça isso agora", específico e barato.
**Time:** costuma ser a última da fila (JÃO constrói, Chico veste, Zé produz, Cocota ensina, Sharon leva ao mercado); Sr. Barriga audita o número dela.
**Custo:** ~740 tok fixo / ~6,1k ao ser invocado (a maior skill do time).

### Sr. Barriga
**Arquivo:** `skills/sr-barriga/` (308 linhas) · `agents/sr-barriga.md`
**Apelidos:** `#srbarriga` `#barriga` `*Sr. Barriga` `Sr Barriga` `Seu Barriga` `senhor Barriga` `/sr-barriga`
**Domínio:** finanças, contabilidade, tributação, investimento, custo, risco, otimização.
**Regras centrais:**
- "Se não calculou, não decidiu" — proíbe "barato"/"caro"/"vale a pena" sem número.
- Nunca confunde faturamento com lucro; economia real desconta custo indireto.
- **Último filtro financeiro do time** — veto não derrubável por argumento de custo, prazo ou marketing.
- Nome sempre com "Sr." — `#barriga` é atalho de digitação, não forma de tratamento.
**Time:** valida o número por trás de qualquer proposta de qualquer especialista; parceria natural com Zizu e com Tião.
**Custo:** ~720 tok fixo / ~5,5k ao ser invocado.

### Netzinha
**Arquivo:** `skills/netzinha/` (257 linhas) · `agents/netzinha.md`
**Apelidos:** `#netzinha` `#neti` `*Netzinha` `Netzinha da IA` `/netzinha`
**Domínio:** radar de modelos, ferramentas, preços e benchmarks de IA; arquitetura de agentes.
**Regras centrais:**
- Não existe "melhor IA" absoluta — só melhor para qual tarefa, com qual restrição.
- Hierarquia de evidência: documentação oficial > resultado reproduzível > benchmark > teste independente > relato > notícia > rumor.
- **Nome escolhido de propósito** para não colidir com `.NET`, `internet`, `NET` operadora — homônimo real, resolvido no próprio nome.
**Time:** indica tecnologia, cada especialista decide dentro do próprio domínio; parceria com Zizu na otimização de uso do modelo escolhido.
**Custo:** ~680 tok fixo / ~4,7k ao ser invocado.

### Bob
**Arquivo:** `skills/bob-bemestar/` (292 linhas) · `agents/bob-bemestar.md`
**Apelidos:** `#bob` `#bobbem` `*Bob` `Bob do bem-estar` `Bob da saúde` `Bob.` `/bob-bemestar`
**Domínio:** bem-estar, nutrição, hábitos, sono, movimento, ervas, suplementos, práticas tradicionais.
**Regras centrais:**
- **Não é médico nem prescritor** — não diagnostica, não prescreve, encaminha o que for clínico.
- Filtro Bob: toda alegação recebe selo (tradicional/plausível/evidência/evidência limitada/hype/risco/desconhecido), por alegação, não por substância.
- Nunca começa uma resposta de cansaço pelo suplemento.
**Time:** ressalva de segurança não derrubável por custo, prazo ou marketing — nenhuma alegação de saúde sai de qualquer especialista sem passar por ele.
**Custo:** ~710 tok fixo / ~5,1k ao ser invocado.

### Tião da Solução
**Arquivo:** `skills/tiao-solucao/` (301 linhas) · `agents/tiao-solucao.md`
**Apelidos:** `#tiao` `#tiaosol` `*Tião da Solução` `Tião do conserto` `Tião.` `/tiao-solucao`
**Domínio:** resolução prática do dia a dia — conserto, material, ferramenta, compatibilidade de peça, onde comprar.
**Regras centrais:**
- Diagnóstico antes de qualquer produto; recusa "quebrou, troca" quando dá pra reparar.
- Etiqueta toda solução: 🟢 definitiva / 🟡 econômica / 🟠 provisória / 🔴 gambiarra de emergência.
- Antes de improvisar: "se isso falhar, o que acontece?" — nunca improvisa em elétrica, gás, estrutura, freio.
**Time:** acha a alternativa barata; Sr. Barriga calcula se compensa com durabilidade e risco na conta.
**Custo:** ~800 tok fixo / ~5,2k ao ser invocado.

### Chefe
**Arquivo:** `skills/chefe/` (144 linhas — a mais enxuta do time) · `agents/chefe.md`
**Apelidos:** `#chefe` `#analisefinal` `*Chefe` `análise final` `decisão final` `/chefe`
**Domínio:** não tem domínio próprio — sintetiza decisão quando os pareceres colidem ou a decisão é grande.
**Regras centrais:**
- Formato fixo: objetivo, contexto, pareceres, concordância, divergência (com a causa), riscos por opção, recomendação, e sempre "aceitar / alterar / rejeitar / discutir" no fim.
- Nunca inventa parecer de quem não falou — chama quem falta ou marca a lacuna.
- Nunca amacia divergência real em consenso falso; nunca derruba o veto do Sr. Barriga nem as ressalvas do Bob e do Tião.
**Time:** papel transversal — o único que devolve formalmente a decisão ao usuário, nunca presume aceite.
**Custo:** ~520 tok fixo / ~2,6k ao ser invocado (a mais barata do time).

### Zizu
**Arquivo:** `skills/zizu-otimizacao/` (265 linhas) · `agents/zizu-otimizacao.md`
**Apelidos:** `#zizu` `#zizuotimiza` `*Zizu` `Zizu da otimização` `/zizu-otimizacao`
**Domínio:** otimização digital transversal — token, custo de IA, automação, macete verificado.
**Regras centrais:**
- Limite ético logo no topo: "macete sim, malandragem não" — nunca ensina fraude, invasão, burla de pagamento.
- Classifica todo macete: confirmado/provável/experimental/não confirmado/clickbait/falso.
- **Fronteiras explícitas** com quem ele conceitualmente combina: Netzinha escolhe a ferramenta, Zizu otimiza o uso; Sr. Barriga valida o número, Zizu propõe a alternativa técnica; Tião resolve o físico, Zizu resolve o digital.
**Time:** revisa qualquer especialista perguntando "existe forma mais eficiente?" — papel transversal.
**Custo:** ~720 tok fixo / ~4,7k ao ser invocado.

### Tuca
**Arquivo:** `skills/tuca/` (263 linhas + `references/checklists.md` + `references/relatorio.md`) · `agents/tuca.md`
**Apelidos:** `#tuca` `#pentefino` `*Tuca` `passa o pente fino` `auditoria completa` `/tuca`
**Domínio:** fiscal e auditor — reconstrói o estado real do projeto, sem confiar em "está pronto" sem evidência.
**Regras centrais:**
- Arquitetura própria: coleta → consolidação → análise sobre o consolidado → verificação pontual → relatório — desenhada pra nunca reler o projeto inteiro por dúvida pontual.
- Auditoria incremental quando já existe snapshot anterior: atualiza o que mudou, não reprocessa o que continua igual.
- Fiscaliza o projeto, nunca a pessoa: "a implementação não corresponde ao requisito X", nunca "o Fulano errou".
- **Único par do time que não converge automático** — pode discordar do Chefe com evidência concreta.
**Time:** papel transversal — audita o trabalho de qualquer um sem substituir o julgamento de domínio.
**Custo:** ~550 tok fixo / ~4,4k ao ser invocado.

### Bile
**Arquivo:** `skills/bile/` (212 linhas + `references/gramatica.md` + `references/storyboard.md`) · `agents/bile.md`
**Apelidos:** `#bile` `#bilecinema` `*Bile` `Bile do cinema` `/bile`
**Domínio:** direção cinematográfica de vídeo com IA — conceito, enquadramento, câmera, luz, storyboard, prompt adaptado à ferramenta.
**Regras centrais:**
- Sequência fixa: ideia → direção → cinematografia → produção → prompt → geração → edição — nunca pula direto pro prompt.
- Zoom ≠ dolly; movimento de câmera sempre com função narrativa, nunca decoração.
- Cena complexa demais pra IA sustentar numa tomada → divide em planos controlados.
- Nunca afirma que uma ferramenta tem um controle sem confirmação.
**Time:** trabalha com Zé (geração), Zizu (economia) e Sr. Barriga (análise financeira) na economia de produção — mais recente do time, adicionado por último.
**Custo:** ~570 tok fixo / ~3,4k ao ser invocado.

---

## 3. Tabela de custo (medido, não estimado)

| Especialista | Fixo (sempre) | Ao ser chamado |
|---|---:|---:|
| Tião da Solução | ~800 | ~5,2k |
| Sharon das Oportunidades | ~740 | ~6,1k |
| Sr. Barriga | ~720 | ~5,5k |
| Zizu | ~720 | ~4,7k |
| Bob | ~710 | ~5,1k |
| Tia Cocota | ~680 | ~5,1k |
| Netzinha | ~680 | ~4,7k |
| Chico Designer | ~640 | ~5,7k |
| JÃO dos apps | ~600 | ~5,7k |
| Bile | ~570 | ~3,4k |
| Tuca | ~550 | ~4,4k |
| Chefe | ~520 | ~2,6k |
| Zé das Imagens | ~480 | ~4,4k |
| **Total fixo** | **~12.211** | — |

O "fixo" é pago em **toda mensagem**, esteja o especialista ativo ou não — é o preço de
tê-los todos disponíveis o tempo todo. O "ao ser chamado" só entra quando a doutrina
completa é carregada na conversa.

---

## 4. Pontas em aberto (honestidade, não pendência escondida)

- **DNA da Tia Cocota** (`references/dna.md`) foi escrito por quem construiu o time, não
  revisado formalmente pelo autor original — é o que qualquer "cocotinha" futura herda,
  vale conferir antes de derivar uma.
- **Arquitetura da Tia Cocota** (`references/arquitetura.md`) é blueprint — nada dela
  está de pé (API, memória persistente, agentes-filhos). Documento existe pra guiar
  construção futura, não descreve algo funcionando hoje.
- **Propagação entre máquinas não é automática.** Cada ambiente/sessão precisa rodar o
  bloco de instalação da seção 1.2 separadamente; só este repositório tem o
  SessionStart hook que se autoinstala sozinho.
- **Custo é estimativa da própria ferramenta** (`claude plugin details`), não medição
  de token real gasto em produção.

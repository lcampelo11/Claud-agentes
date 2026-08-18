# Tia Cocota — blueprint de arquitetura

**Estado: projeto, não implementação.** Nada aqui está de pé. Este documento existe
para que, quando o produto for construído, ele nasça com a forma certa — e para que
nenhuma decisão de hoje feche uma porta de amanhã.

Construir isto é território do **`#jaoapp` (JÃO dos apps)**. Este documento é a
especificação pedagógica que ele recebe.

## Princípio

A Tia Cocota é o **cérebro**, não o produto. Um aplicativo é apenas uma das interfaces
por onde esse cérebro é usado.

```
TIA COCOTA (matriz)
├── agentes derivados  → especializações
├── aplicativos        → interfaces / produtos
├── API                → canal de comunicação
├── ferramentas        → capacidades externas
├── memória            → contexto persistente do aluno
└── conhecimento       → base educacional
```

O aplicativo **não** deve conhecer nem reproduzir o cérebro pedagógico. Ele envia
contexto e recebe resposta estruturada.

## Ramificação prevista

```
                        TIA COCOTA
                            │
        ┌───────────────────┼───────────────────┐
    por faixa            por disciplina      por objetivo
        │                   │                   │
   Cocotinha            Matemática           Leitura
   Cocota Fundamental   Português            Redação
   Cocota Médio         Ciências / Física    Provas
   Cocota ENEM          Química / Biologia   Simulados
   Cocota Vestibular    História / Geografia
                        Inglês
```

Nomes são exemplos arquiteturais — nenhum precisa ser criado automaticamente. A regra
que vale: **toda derivada herda o DNA (`dna.md`) e recebe uma especialização própria.**

## Delegação a especialistas

```
ALUNO → COCOTINHA
          ├─ identifica: dificuldade em Álgebra
          ├─ aciona especialista de Álgebra (com contexto do aluno)
          ├─ recebe o resultado
          ├─ AVALIA criticamente o resultado
          └─ explica ao aluno na linguagem da idade dele
```

O aluno não precisa saber que houve delegação. Ao delegar, a agente continua
responsável por: interpretar a necessidade · fornecer contexto · avaliar a resposta ·
adaptar a linguagem · verificar consistência · decidir o próximo passo pedagógico.

Sem especialista disponível, responde direto. **Delegação desnecessária é custo e ruído.**

## Contrato de API (conceitual)

```
APLICATIVO → BACKEND → TIA COCOTA → MODELO → RESPOSTA → APLICATIVO
```

**Entrada:** aluno · série · idade ou faixa · matéria · conteúdo · objetivo · histórico
relevante · dificuldade conhecida · pergunta · contexto da sessão.

**Saída:** resposta · explicação · nível de dificuldade · conceito trabalhado ·
diagnóstico · próximo passo · exercício sugerido · necessidade de revisão.

Formatos conceituais — adaptar à plataforma real. O valor está nos campos, não na
sintaxe: **saída estruturada é o que permite o app acompanhar evolução sem reler texto
corrido.**

## Perfil pedagógico do aluno

```
ALUNO
  série · idade
  DOMINA:        conteúdos consolidados
  DIFICULDADES:  conteúdos em aberto
  DESEMPENHO:    histórico recente
  OBJETIVO:      meta declarada
```

Vive **fora** do agente, viaja entre versões, pertence ao aluno. Isolamento entre
alunos é requisito, não detalhe.

## Versionamento

`TIA COCOTA v1.0 → v1.1 → v2.0`

Atualização do núcleo **não pode** alterar de forma imprevisível uma derivada já em uso.
Preservar: compatibilidade · histórico de mudanças · número de versão · especializações
· configurações · ferramentas · regras.

Toda derivada declara de qual versão do DNA herdou. Mudança de DNA que quebra
compatibilidade é **major**, e as derivadas migram conscientemente.

## Segurança (quando virar serviço)

Autenticação · autorização · controle de acesso · limite de uso · proteção contra abuso
· proteção de credenciais · controle de custo · **isolamento de dados entre alunos** ·
proteção de dados pessoais de menores · logs · auditoria.

Regra dura: **chave e credencial de modelo ou serviço externo nunca no aplicativo.**
Sempre atrás do backend.

Dado de menor de idade eleva o nível de exigência — trate como categoria sensível desde
o primeiro dia, não como ajuste posterior.

## Custo

Permitir medir consumo por usuário · por aplicativo · por agente · por tarefa · por
modelo · por ferramenta, e identificar chamada desnecessária.

Tarefa simples usa solução econômica; tarefa complexa usa modelo capaz. Meta:
**máxima qualidade pedagógica com o menor custo operacional.**

## Extensibilidade

Nascer preparada para receber: novas disciplinas · novos agentes · novos aplicativos ·
novas ferramentas · novas fontes de conhecimento · novas faixas etárias · novas
modalidades · novos modelos · novas APIs · novos sistemas de avaliação.

O primeiro aplicativo não é o único produto. Evite a decisão que torna a expansão
desnecessariamente difícil — e evite também construir a expansão antes de existir
demanda por ela.

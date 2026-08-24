# Tuca — modelo de relatório e estrutura de snapshot

## Relatório completo de auditoria

```
TUCA — AUDITORIA GERAL DO PROJETO

DATA/ESTADO ANALISADO:
[referência temporal ou versão]

OBJETIVO DO PROJETO:
[resumo]

ESTADO GERAL:
🟢 / 🟡 / 🟠 / 🔴

O QUE ESTÁ CONCLUÍDO:
[lista]

O QUE ESTÁ PARCIAL:
[lista]

O QUE ESTÁ PENDENTE:
[lista]

O QUE FOI ESQUECIDO:
[lista]

O QUE ESTÁ DESATUALIZADO:
[lista]

INCONSISTÊNCIAS:
[lista]

RISCOS:
[lista]

DOCUMENTAÇÃO:
[estado]

IMPLEMENTAÇÃO:
[estado]

TESTES:
[estado]

PONTAS SOLTAS:
[lista]

ALTERAÇÕES DESDE A ÚLTIMA AUDITORIA:
[lista]

PRIORIDADES:
[ordem de execução]

RECOMENDAÇÃO:
[o que precisa acontecer agora]
```

## Estrutura de referência para consolidação

Não é obrigação — adapte ao ambiente disponível. Serve para separar informação
coletada de análise:

```
.audit/
├── snapshot.md
├── inventory.md
├── requirements.md
├── decisions.md
├── changes.md
├── pending.md
└── audit-report.md
```

## O que um snapshot pode conter

Estrutura do projeto · inventário de arquivos · caminhos · tamanhos · datas · versões ·
alterações relevantes · requisitos · decisões · pendências · TODOs/FIXMEs ·
documentação relevante · referências entre arquivos · configurações importantes ·
testes · resultados · indicadores de estado · trechos relevantes · identificadores de
versão · hashes quando disponíveis.

Não precisa copiar arquivo inteiro — precisa ter o suficiente pra maior parte da
auditoria não reprocessar o projeto todo.

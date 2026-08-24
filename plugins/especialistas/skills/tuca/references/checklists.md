# Tuca — checklists de apoio

Carregue para uma auditoria completa, uma caça sistemática a esquecimento ou uma
revisão de estrutura a fundo.

## 1. Coleta — onde procurar

Estrutura de pasta · arquivo · arquivo oculto relevante · documentação · código ·
configuração · requisito · especificação · decisão · alteração · teste · TODO · FIXME ·
placeholder · pendência · dependência · integração · histórico disponível · arquivo
temporário · versão · referência.

## 2. Detector de esquecimento — exemplos a procurar

Funcionalidade mencionada e nunca criada · alteração solicitada e nunca aplicada ·
documentação não atualizada · configuração esquecida · teste nunca realizado · tela
criada sem integração · botão sem ação · API sem tratamento adequado · arquivo sem
referência · requisito antigo ainda presente · regra nova não refletida em outra parte
· tarefa marcada concluída sem evidência · componente criado e nunca conectado ·
dependência esquecida · comportamento definido num lugar e ignorado em outro.

## 3. Revisão de estrutura

Diretório · subdiretório · arquivo · script · asset · componente · módulo · teste ·
configuração.

Procure: arquivo órfão · duplicado · versão antiga · arquivo abandonado · arquivo
temporário · arquivo que deveria existir e não existe · referência quebrada · estrutura
duplicada sem necessidade.

## 4. Revisão de alteração recente

Essa mudança exigia mudar outra coisa? Documentação ficou desatualizada? Componente
ficou incompatível? Referência aponta pra versão antiga? Funcionalidade dependente
quebrou?

## 5. Documentação

README · especificação · documentação técnica · manual · instrução · comentário ·
changelog · configuração · arquivo de referência.

Pergunta central: a documentação representa o estado atual? Não → desatualizada.

## 6. Código (fiscaliza, não substitui o JÃO)

Estrutura · import · referência · componente · função · API · tratamento de erro ·
TODO/FIXME · código morto · duplicação · inconsistência · configuração · teste ·
dependência.

## 7. Interface e design (encaminha julgamento especializado ao Chico)

Tela prevista · tela existente · navegação · link · botão · estado · texto ·
componente · responsividade · consistência · integração entre interface e
funcionalidade.

## 8. Funcionalidade — nove perguntas

Foi planejada? Foi implementada? Foi integrada? Está acessível ao usuário? Está
documentada? Foi testada? Está funcionando? Está atualizada? Existe dependência
pendente?

## 9. Testes

Quais existem · quais foram executados · quais passaram · quais falharam · quais nunca
rodaram · qual funcionalidade importante não tem cobertura adequada.

**Não testado ≠ funcionando.**

## 10. Configuração e dependência (sem expor segredo)

Variável de ambiente · configuração · versão · dependência · integração · script ·
serviço externo · configuração específica de ambiente. Mencione que existe, nunca
revele o valor de chave ou token.

## 11. Auditoria de decisão

A decisão ainda é válida? Foi implementada? Parcialmente? Mudança posterior contradiz?
Existe decisão mais recente? Documentação foi atualizada?

## 12. Classificação de pendência — campos obrigatórios

```
ID · DESCRIÇÃO · ORIGEM · EVIDÊNCIA · IMPACTO · PRIORIDADE · DEPENDÊNCIAS · PRÓXIMA AÇÃO
```

Prioridade: 🔴 crítica (impede funcionamento, segurança ou entrega) · 🟠 alta (afeta
significativamente) · 🟡 média (importante, não bloqueadora) · 🟢 baixa (melhoria ou
ajuste não crítico).

# Resolver Conflitos de Merge

Conflitos de merge acontecem quando duas pessoas editam a mesma parte do mesmo ficheiro. Não são erros - são oportunidades de decidir que versão manter!

## 🎯 Objetivos

- Entender porque acontecem conflitos
- Identificar conflitos num ficheiro
- Resolver conflitos manualmente
- Resolver conflitos no Positron
- Prevenir conflitos

---

## 🤔 O que é um Conflito?

### Cenário Típico

**Ana** edita linha 15 de `analise.R`:
```r
total <- sum(vendas$valor_total)
```

**Bruno** (ao mesmo tempo) edita a mesma linha 15:
```r
total <- sum(vendas$quantidade * vendas$preco)
```

**Ana** faz push primeiro ✅

**Bruno** tenta push:
```bash
git push
# ❌ Erro: updates were rejected

git pull
# ⚠️ CONFLICT (content): Merge conflict in analise.R
# Automatic merge failed; fix conflicts and then commit.
```

**Git não consegue decidir**: Manter versão da Ana? Do Bruno? Ambas? Nenhuma?

**Solução**: Bruno tem de resolver manualmente.

---

## 🔍 Anatomia de um Conflito

Quando há conflito, Git marca o ficheiro assim:

```r
# Código sem conflitos funciona normalmente

<<<<<<< HEAD (Current Change)
total <- sum(vendas$quantidade * vendas$preco)  # Versão do Bruno (local)
=======
total <- sum(vendas$valor_total)                # Versão da Ana (remoto)
>>>>>>> origin/main

# Resto do código
```

**Marcadores**:
- `<<<<<<< HEAD`: Início do conflito (tua versão)
- `=======`: Separador entre versões
- `>>>>>>> origin/main`: Fim do conflito (versão do remoto)

**Objetivo**: Escolher ou combinar, remover os marcadores.

---

## 🛠️ Resolver Conflito Manualmente

### Passo a Passo

**1. Identificar ficheiros com conflito**:
```bash
git status
```

Output:
```
Unmerged paths:
  both modified:   scripts/analise.R
```

**2. Abrir o ficheiro** no editor.

**3. Procurar marcadores** `<<<<<<<`.

**4. Decidir que versão usar**:

**Opção A - Manter a tua versão**:
```r
# Antes (com marcadores):
<<<<<<< HEAD
total <- sum(vendas$quantidade * vendas$preco)
=======
total <- sum(vendas$valor_total)
>>>>>>> origin/main

# Depois (escolher HEAD):
total <- sum(vendas$quantidade * vendas$preco)
```

**Opção B - Manter versão do remoto**:
```r
total <- sum(vendas$valor_total)
```

**Opção C - Combinar ambas**:
```r
# Usar versão do remoto mas adicionar validação
total <- sum(vendas$valor_total, na.rm = TRUE)
```

**Opção D - Escrever nova solução**:
```r
# Melhor ainda: usar coluna que sempre existe
total <- vendas %>%
  mutate(receita = quantidade * valor_unitario) %>%
  summarise(total = sum(receita)) %>%
  pull(total)
```

**5. Apagar os marcadores** `<<<<<<<`, `=======`, `>>>>>>>`.

**6. Testar o código**:
```r
source("scripts/analise.R")
# ✅ Verificar que funciona
```

**7. Marcar como resolvido e commit**:
```bash
git add scripts/analise.R
git commit -m "Resolver conflito em cálculo de total

Usar valor_total que é calculado em importação"
git push
```

✅ **Conflito resolvido!**

---

## 💻 Resolver Conflitos no Positron

O Positron tem interface visual para ajudar.

### Identificar Conflitos

**Painel Git**:
- Ficheiros com conflito têm ícone especial (⚠️)
- Estado: "both modified"

### Resolver Visualmente

**1. Clica no ficheiro** com conflito.

**2. Positron mostra** interface de merge:
- **Current Change** (HEAD): Tua versão
- **Incoming Change**: Versão do remoto
- Botões:
  - `Accept Current Change`
  - `Accept Incoming Change`
  - `Accept Both Changes`
  - `Compare Changes`

**3. Escolhe uma opção** ou edita manualmente.

**4. Guarda o ficheiro**.

**5. No painel Git**:
- Stage o ficheiro (checkbox)
- Escreve mensagem de commit
- Clica "Commit"

**6. Push**:
```bash
git push
```

---

## 🎯 Exercício: Criar e Resolver Conflito

Vamos criar um conflito intencional para praticar.

### Setup (se trabalhares sozinho)

**Simular duas pessoas** usando branches:

```bash
# 1. Main atualizada
git checkout main
git pull

# 2. Criar branch "pessoa-a"
git checkout -b pessoa-a

# 3. Editar analise.R linha 10
# Adicionar:
media_vendas <- mean(vendas$valor_total)

git add scripts/03-analise.R
git commit -m "Pessoa A: adicionar média"
git push -u origin pessoa-a

# 4. Voltar para main
git checkout main

# 5. Criar branch "pessoa-b"
git checkout -b pessoa-b

# 6. Editar a MESMA linha 10
# Adicionar:
mediana_vendas <- median(vendas$valor_total)

git add scripts/03-analise.R
git commit -m "Pessoa B: adicionar mediana"
git push -u origin pessoa-b
```

### Cenário: Fazer Merge das Duas Branches

**1. Fazer merge da primeira** (pessoa-a):
```bash
git checkout main
git merge pessoa-a
git push
```

✅ Sem problemas!

**2. Tentar merge da segunda** (pessoa-b):
```bash
git merge pessoa-b
```

⚠️ **CONFLITO!**

```
Auto-merging scripts/03-analise.R
CONFLICT (content): Merge conflict in scripts/03-analise.R
Automatic merge failed; fix conflicts and then commit the result.
```

**3. Ver o ficheiro**:
```r
<<<<<<< HEAD
media_vendas <- mean(vendas$valor_total)
=======
mediana_vendas <- median(vendas$valor_total)
>>>>>>> pessoa-b
```

**4. Resolver** - Vamos manter ambas:
```r
# Estatísticas descritivas
media_vendas <- mean(vendas$valor_total)
mediana_vendas <- median(vendas$valor_total)
```

**5. Marcar como resolvido**:
```bash
git add scripts/03-analise.R
git commit -m "Merge pessoa-b: combinar média e mediana"
git push
```

**6. Limpar branches**:
```bash
git branch -d pessoa-a
git branch -d pessoa-b
git push origin --delete pessoa-a
git push origin --delete pessoa-b
```

✅ **Conflito resolvido e branches limpas!**

---

## 🚨 Tipos Comuns de Conflitos

### 1. Conflito de Conteúdo

**Causa**: Mesma linha editada.

**Exemplo**:
```r
<<<<<<< HEAD
library(ggplot2)
=======
library(tidyverse)  # Inclui ggplot2
>>>>>>> main
```

**Resolução**: Decidir qual é melhor ou combinar.

### 2. Conflito de Ordem

**Causa**: Linhas adicionadas em lugares diferentes.

**Exemplo**:
```r
library(tidyverse)
<<<<<<< HEAD
library(lubridate)
library(scales)
=======
library(scales)
library(lubridate)
>>>>>>> main
```

**Resolução**: Escolher ordem lógica.

### 3. Conflito de Remoção vs Edição

**Causa**: Uma pessoa apaga, outra edita.

**Exemplo**:
```r
<<<<<<< HEAD
# Linha foi apagada
=======
funcao_antiga <- function(x) { x + 1 }
>>>>>>> main
```

**Resolução**: Decidir se a função deve existir.

### 4. Conflito em Imports/Bibliotecas

**Causa**: Ambos adicionam bibliotecas.

**Resolução**: Geralmente aceitar ambas.

---

## 🛡️ Prevenir Conflitos

### Estratégia 1: Comunicação

```
Ana: "Vou trabalhar no script de análise hoje"
Bruno: "OK, eu trabalho nas visualizações"
```

✅ Trabalham em ficheiros diferentes = sem conflitos!

### Estratégia 2: Pull Frequente

```bash
# Início do dia
git pull

# A cada 1-2 horas
git pull

# Antes de começar nova tarefa
git pull
```

✅ Apanhas alterações cedo, conflitos são menores.

### Estratégia 3: Commits Pequenos e Frequentes

```bash
# A cada funcionalidade pequena completa
git commit -m "Adicionar função calcular_media"
git push

# Não esperar muito tempo
```

✅ Menos alterações = menos risco de conflitos.

### Estratégia 4: Usar Branches Separadas

```
main
├── feature-ana-analise
└── feature-bruno-graficos
```

✅ Conflitos só aparecem no PR, não durante desenvolvimento.

### Estratégia 5: Modularizar Código

**Em vez de um ficheiro grande**:
```
scripts/
└── analise.R  # 500 linhas - todos editam aqui!
```

**Vários ficheiros pequenos**:
```
scripts/
├── analise-regional.R      # Ana trabalha aqui
├── analise-produto.R       # Bruno trabalha aqui
└── analise-temporal.R      # Carlos trabalha aqui
```

✅ Cada pessoa no seu ficheiro = sem conflitos!

---

## 🔧 Ferramentas Avançadas

### Git Mergetool

Usar ferramenta visual externa:

```bash
# Configurar (exemplo com VSCode)
git config --global merge.tool vscode
git config --global mergetool.vscode.cmd 'code --wait $MERGED'

# Quando há conflito:
git mergetool
```

Abre interface visual para resolver.

### Estratégia Ours vs Theirs

**Aceitar todas as versões de um lado**:

```bash
# Aceitar sempre a versão do remoto (theirs)
git checkout --theirs scripts/analise.R
git add scripts/analise.R

# Aceitar sempre a minha versão (ours)
git checkout --ours scripts/analise.R
git add scripts/analise.R
```

⚠️ **Cuidado**: Usa só se tiveres certeza!

### Abortar Merge

**Se entraste em pânico**:

```bash
# Desfazer tudo e voltar ao estado antes do merge
git merge --abort
```

Podes tentar novamente depois de planear melhor.

---

## ✅ Boas Práticas de Resolução

### DO ✅

**1. Perceber ambas as versões**
- Porque foi mudado?
- Qual resolve melhor o problema?

**2. Testar após resolver**
```r
# Sempre testar
source("scripts/analise.R")
```

**3. Commit message claro**
```bash
git commit -m "Resolver conflito em cálculo de total

Usar valor_total em vez de quantidade * preco porque valor_total
já inclui descontos aplicados"
```

**4. Comunicar com quem criou o conflito**
- "Resolvi o conflito usando a tua abordagem porque X"
- "Combinei ambas as versões porque Y"

### DON'T ❌

**1. Apagar código sem perceber**
- Não apagues código só para resolver rápido!

**2. Aceitar tudo automaticamente**
- `Accept Both Changes` pode criar bugs

**3. Não testar após resolver**
- Código pode compilar mas não funcionar

**4. Mensagens vagas**
```bash
git commit -m "fix conflict"  # ❌
```

---

## 🎓 Checklist de Resolução

Quando encontras conflito:

- [ ] Identifiquei todos os ficheiros com conflito (`git status`)
- [ ] Abri cada ficheiro e procurei marcadores `<<<<<<<`
- [ ] Percebi ambas as versões do código
- [ ] Decidi conscientemente qual versão usar (ou combinar)
- [ ] Removi TODOS os marcadores `<<<<<<<`, `=======`, `>>>>>>>`
- [ ] Testei o código localmente
- [ ] Fiz commit com mensagem descritiva
- [ ] Push para o remoto
- [ ] (Opcional) Comuniquei com quem criou o conflito

---

## 🆘 Situações de Emergência

### "Tenho muitos conflitos, não sei resolver!"

```bash
# Abortar o merge
git merge --abort

# Pedir ajuda a colega mais experiente
# Ou fazer merge ficheiro a ficheiro:
git checkout --theirs ficheiro-complicado.R
git checkout --ours ficheiro-que-sei.R
git add .
git commit
```

### "Resolvi mal um conflito, como desfazer?"

**Se ainda não fizeste push**:
```bash
# Desfazer o commit de merge
git reset --hard HEAD~1

# Tentar novamente
git merge branch-name
```

**Se já fizeste push**:
```bash
# Criar novo commit que reverte
git revert HEAD

# Explicar o que aconteceu
# Tentar merge novamente com mais cuidado
```

---

## 🎉 Próximo Passo

Parabéns! Agora dominas:
- Conceitos básicos de Git
- Branches
- Pull Requests
- Resolução de conflitos

Vamos juntar tudo num [Exercício Completo End-to-End](11-exercicio-completo.md)!

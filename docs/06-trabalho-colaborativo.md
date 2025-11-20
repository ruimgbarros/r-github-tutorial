# Trabalho Colaborativo

Até agora trabalhaste sozinho no teu fork. Agora vamos aprender como várias pessoas podem trabalhar no mesmo projeto simultaneamente.

## 🎯 Objetivos

Neste módulo vais aprender:
- Como colaborar num repositório partilhado
- Adicionar colaboradores ao projeto
- Evitar e resolver conflitos básicos
- Boas práticas de colaboração

---

## 👥 Modelos de Colaboração

Existem dois modelos principais para colaborar no GitHub:

### Modelo 1: Fork + Pull Request

```
Repositório Original (DataH)
         ↓ fork
    Teu Fork
         ↓ clone
  Teu Computador
         ↓ push to fork
    Teu Fork
         ↓ Pull Request
Repositório Original ← Review & Merge
```

**Quando usar**: Projetos open-source, contribuições externas

### Modelo 2: Acesso Direto + Branches

```
Repositório Partilhado (DataH)
         ↓ clone
  Teu Computador
         ↓ create branch
  feature-branch
         ↓ push
  Repositório Partilhado
         ↓ Pull Request
  main branch ← Review & Merge
```

**Quando usar**: Equipas internas, projetos privados

**Neste tutorial vamos focar no Modelo 2** (mais comum em equipas).

---

## ➕ Adicionar Colaboradores

### No GitHub (repositório privado/organização)

1. **Vai às Settings do repositório**
2. **Collaborators → Add people**
3. **Procura pelo username ou email** do colega
4. **Seleciona a permissão**:
   - **Read**: Só ver código
   - **Write**: Fazer commits, branches, PRs
   - **Admin**: Controlo total

5. **Send invitation**

O colega recebe email e tem de aceitar.

---

## 🔄 Workflow Colaborativo Básico

Vamos simular um cenário com 2 pessoas: **Ana** e **Bruno**.

### Configuração Inicial

**Ana** (líder do projeto):
```bash
# Criar repositório no GitHub
# Adicionar Bruno como colaborador
# Fazer clone
git clone https://github.com/datah/projeto-analise.git
cd projeto-analise
```

**Bruno**:
```bash
# Aceitar convite
# Fazer clone do MESMO repositório
git clone https://github.com/datah/projeto-analise.git
cd projeto-analise
```

### Cenário 1: Trabalho em Ficheiros Diferentes (Fácil!)

**Ana** trabalha no script de importação:
```bash
# Ana edita scripts/01-importar-dados.R
git add scripts/01-importar-dados.R
git commit -m "Adicionar validação de dados"
git push
```

**Bruno** trabalha no script de análise:
```bash
# Bruno edita scripts/03-analise.R
git add scripts/03-analise.R
git commit -m "Implementar análise por região"

# Antes de push, fazer pull!
git pull   # ← Traz alterações da Ana

# Agora push
git push
```

✅ **Sem conflitos!** Ficheiros diferentes não conflituam.

### Cenário 2: Trabalho no Mesmo Ficheiro, Partes Diferentes

**Ana** adiciona função no início do ficheiro:
```r
# ana edita linha 10-20 de utils.R

calcular_total <- function(df) {
  sum(df$valor, na.rm = TRUE)
}
```

```bash
git add utils.R
git commit -m "Adicionar função calcular_total"
git push
```

**Bruno** adiciona função no fim do ficheiro:
```r
# bruno edita linha 50-60 de utils.R

formatar_moeda <- function(valor) {
  paste0("€", format(valor, big.mark = " "))
}
```

```bash
git add utils.R
git commit -m "Adicionar função formatar_moeda"
git pull   # ← Git faz merge automático!
git push
```

✅ **Git é inteligente!** Consegue juntar alterações em partes diferentes do mesmo ficheiro.

### Cenário 3: Trabalho na Mesma Linha (Conflito!)

**Ana** e **Bruno** editam a mesma linha:

**Ana**:
```r
# Linha 15 de analise.R
total_vendas <- sum(vendas$valor_total)
```

**Bruno** (ao mesmo tempo):
```r
# Linha 15 de analise.R
total_vendas <- sum(vendas$quantidade * vendas$preco)
```

**Ana** faz push primeiro:
```bash
git push  # ✅ Sucesso
```

**Bruno** tenta push:
```bash
git push  # ❌ Erro: updates were rejected
git pull  # ⚠️ CONFLITO!
```

Git mostra:
```r
<<<<<<< HEAD
total_vendas <- sum(vendas$quantidade * vendas$preco)
=======
total_vendas <- sum(vendas$valor_total)
>>>>>>> origin/main
```

**Bruno resolve** (vamos ver isto em detalhe no módulo de conflitos):
```r
# Escolher uma versão ou combinar
total_vendas <- sum(vendas$valor_total)
```

```bash
git add analise.R
git commit -m "Resolver conflito em cálculo de total"
git push  # ✅ Agora funciona
```

---

## 📋 Boas Práticas para Evitar Conflitos

### 1. Comunicar com a Equipa

✅ **Fazer**:
```
Ana: "Vou trabalhar no script de importação hoje"
Bruno: "OK, eu trabalho na análise regional"
```

❌ **Evitar**:
- Ambos editarem o mesmo ficheiro sem avisar

### 2. Pull Frequentemente

```bash
# Início do dia
git pull

# Antes de começar tarefa nova
git pull

# A cada 1-2 horas se equipa está ativa
git pull
```

### 3. Commits Pequenos e Frequentes

✅ **Bom**:
```bash
# Completou função de importação
git commit -m "Adicionar função ler_vendas"
git push

# Completou função de validação
git commit -m "Adicionar validação de datas"
git push
```

❌ **Mau**:
```bash
# Trabalhou 8 horas sem commit
git commit -m "Muitas alterações"
git push  # ← Alto risco de conflitos!
```

### 4. Usar Branches (Próximo Módulo!)

```bash
# Em vez de trabalhar direto na main:
git checkout -b feature-analise-regional

# Trabalhar na branch
# Fazer PR quando pronto
# Evita conflitos diretos na main!
```

---

## 🎯 Exercício Prático em Grupo

### Objetivo

Simular trabalho colaborativo com um colega.

### Configuração

1. **Uma pessoa (Líder)**:
   - Cria novo repositório no GitHub
   - Adiciona README.md básico
   - Adiciona colega como colaborador

2. **Ambos**:
   ```bash
   git clone <url-do-repositorio>
   cd <repositorio>
   ```

### Exercício 1: Ficheiros Diferentes

**Pessoa A**:
```bash
# Criar ficheiro pessoa-a.txt
echo "Análise da Pessoa A" > pessoa-a.txt
git add pessoa-a.txt
git commit -m "Adicionar análise de A"
git push
```

**Pessoa B**:
```bash
# Criar ficheiro pessoa-b.txt
echo "Análise da Pessoa B" > pessoa-b.txt
git add pessoa-b.txt
git commit -m "Adicionar análise de B"
git pull  # ← Obter ficheiro de A
git push  # ← Enviar o teu
```

**Ambos verificam**: Agora ambos têm os dois ficheiros!

### Exercício 2: Mesmo Ficheiro, Partes Diferentes

**Pessoa A**:
```r
# Criar/editar analise.R
library(tidyverse)

# Análise Norte
vendas_norte <- vendas %>%
  filter(regiao == "Norte")
```

```bash
git add analise.R
git commit -m "Adicionar análise Norte"
git push
```

**Pessoa B**:
```r
# Adicionar ao FINAL de analise.R
# Análise Sul
vendas_sul <- vendas %>%
  filter(regiao == "Sul")
```

```bash
git add analise.R
git commit -m "Adicionar análise Sul"
git pull  # ← Merge automático!
git push
```

### Exercício 3: Criar Conflito Intencional

**Ambos editam README.md** na mesma linha:

**Pessoa A**:
```markdown
# Título do Projeto por Pessoa A
```

**Pessoa B** (ao mesmo tempo):
```markdown
# Título do Projeto por Pessoa B
```

**Pessoa A** faz push primeiro.

**Pessoa B**:
```bash
git push  # ❌ Erro
git pull  # ⚠️ Conflito!

# Resolver conflito no editor
# Escolher título consensual
git add README.md
git commit -m "Resolver conflito no título"
git push
```

---

## 📊 Ver Quem Mudou O Quê (Git Blame)

Para ver quem editou cada linha de um ficheiro:

### No Terminal

```bash
# Ver autoria de cada linha
git blame scripts/analise.R

# Ver com formato mais legível
git blame -L 10,20 scripts/analise.R  # Linhas 10-20 apenas
```

**Output**:
```
a3b2c1d (Ana Costa 2024-01-15) total <- sum(vendas$valor)
b4c3d2e (Bruno Silva 2024-01-16) media <- mean(vendas$valor)
```

### No GitHub

1. Abre o ficheiro no GitHub
2. Clica em "Blame" (botão no topo)
3. Vês quem escreveu cada linha e quando

---

## 🔍 Rastrear Histórico de um Ficheiro

```bash
# Ver histórico de commits que alteraram um ficheiro
git log -- scripts/analise.R

# Ver alterações específicas em cada commit
git log -p -- scripts/analise.R

# Formato resumido
git log --oneline -- scripts/analise.R
```

---

## 💬 Comunicação Eficaz

### Mensagens de Commit Claras

✅ **Bom**:
```bash
git commit -m "Corrigir cálculo de média ponderada em analise.R

A fórmula anterior não considerava os pesos corretamente.
Agora usa weighted.mean() do R base."
```

❌ **Mau**:
```bash
git commit -m "fix"
git commit -m "updates"
git commit -m "a;sldkfj"
```

### Usar Issues do GitHub

Para discussões e planeamento:

1. **Criar Issue**:
   - Vai a "Issues" → "New Issue"
   - Título: "Implementar análise regional"
   - Descrição: Objetivos, tarefas, dúvidas

2. **Referenciar em Commits**:
   ```bash
   git commit -m "Adicionar função análise regional (refs #15)"
   ```

3. **Fechar Issue automaticamente**:
   ```bash
   git commit -m "Finalizar análise regional (closes #15)"
   ```

---

## 🚨 Situações de Emergência

### Alguém fez push de dados sensíveis

```bash
# NÃO É SUFICIENTE só apagar e fazer novo commit!
# Os dados ficam no histórico

# Contactar quem tem acesso ao repo
# Considerar usar git-filter-branch ou BFG Repo Cleaner
# Em último caso: apagar repo e recomeçar
```

### Commits foram para branch errada

```bash
# Se ainda não fizeste push:
git reset --soft HEAD~3  # Desfazer últimos 3 commits
git stash  # Guardar alterações

# Mudar para branch correta
git checkout branch-correta
git stash pop  # Aplicar alterações
git add .
git commit -m "Mensagem"
```

---

## ✅ Checklist de Trabalho Colaborativo

Antes de avançar, confirma que sabes:

- [ ] Adicionar colaboradores a um repositório
- [ ] Fazer clone de repositório partilhado
- [ ] Pull antes de começar a trabalhar
- [ ] Commit e push frequentemente
- [ ] Comunicar sobre que ficheiros estás a editar
- [ ] Resolver conflitos simples
- [ ] Usar `git blame` para ver autoria
- [ ] Escrever mensagens de commit claras

---

## 🎉 Próximo Passo

Agora que sabes colaborar na branch main, vamos aprender sobre [Branches](07-branches.md) - a ferramenta mais poderosa para trabalho colaborativo organizado!

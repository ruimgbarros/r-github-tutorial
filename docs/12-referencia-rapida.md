# Referência Rápida de Comandos

Guia de consulta rápida com os comandos Git mais usados.

---

## ⚙️ Configuração Inicial

```bash
# Configurar nome e email
git config --global user.name "Teu Nome"
git config --global user.email "teu.email@exemplo.com"

# Ver configuração
git config --list

# Configurar editor padrão
git config --global core.editor "code --wait"

# Configurar branch padrão
git config --global init.defaultBranch main
```

---

## 📁 Repositórios

### Criar/Clonar

```bash
# Inicializar novo repositório
git init

# Clonar repositório existente
git clone https://github.com/username/repo.git

# Clonar para pasta específica
git clone https://github.com/username/repo.git pasta-local
```

### Remotos

```bash
# Ver remotos configurados
git remote -v

# Adicionar remoto
git remote add origin https://github.com/username/repo.git

# Mudar URL do remoto
git remote set-url origin https://github.com/username/novo-repo.git

# Remover remoto
git remote remove origin
```

---

## 💾 Commits

### Workflow Básico

```bash
# Ver estado dos ficheiros
git status

# Ver diferenças
git diff                    # Ficheiros modificados
git diff --staged           # Ficheiros staged
git diff arquivo.R          # Ficheiro específico

# Adicionar ficheiros
git add arquivo.R           # Ficheiro específico
git add .                   # Todos os ficheiros
git add *.R                 # Todos os .R
git add pasta/              # Pasta inteira

# Remover da staging area
git reset arquivo.R         # Unstage ficheiro
git reset                   # Unstage tudo

# Commit
git commit -m "Mensagem"    # Com mensagem inline
git commit                  # Abre editor para mensagem

# Adicionar e commit juntos
git add -A && git commit -m "Mensagem"
```

### Corrigir Commits

```bash
# Alterar mensagem do último commit
git commit --amend -m "Nova mensagem"

# Adicionar ficheiros ao último commit
git add esquecido.R
git commit --amend --no-edit

# Desfazer último commit (mantém alterações)
git reset --soft HEAD~1

# Desfazer último commit (remove alterações)
git reset --hard HEAD~1
```

---

## 🌿 Branches

### Criar e Mudar

```bash
# Ver branches
git branch                  # Locais
git branch -a               # Todas (local + remoto)
git branch -v               # Com último commit

# Criar branch
git branch nome-branch

# Criar e mudar para branch
git checkout -b nome-branch
git switch -c nome-branch   # Forma moderna

# Mudar de branch
git checkout nome-branch
git switch nome-branch      # Forma moderna

# Voltar para branch anterior
git checkout -
git switch -
```

### Gerir Branches

```bash
# Renomear branch
git branch -m novo-nome

# Apagar branch local
git branch -d nome-branch   # Só se merged
git branch -D nome-branch   # Forçar

# Apagar branch remota
git push origin --delete nome-branch

# Ver branches merged
git branch --merged
git branch --no-merged
```

---

## 🔄 Sincronização

### Push e Pull

```bash
# Enviar commits
git push                    # Branch atual
git push origin main        # Branch específica
git push -u origin branch   # Primeira vez (set upstream)

# Obter alterações
git pull                    # Fetch + merge
git pull origin main        # Branch específica

# Só descarregar (sem merge)
git fetch
git fetch origin
```

### Atualizar Branch

```bash
# Merge da main para a tua branch
git checkout feature-branch
git merge main

# Rebase sobre a main
git rebase main

# Continuar rebase após resolver conflitos
git add .
git rebase --continue

# Abortar rebase
git rebase --abort
```

---

## 📜 Histórico

### Ver Histórico

```bash
# Log completo
git log

# Log resumido
git log --oneline

# Últimos N commits
git log -5
git log --oneline -10

# Com gráfico de branches
git log --graph --oneline --all

# Histórico de um ficheiro
git log -- arquivo.R
git log -p -- arquivo.R     # Com diffs

# Ver quem mudou cada linha
git blame arquivo.R
```

### Comparar

```bash
# Diferenças entre branches
git diff main...feature-branch

# Commits numa branch que não estão noutra
git log main..feature-branch

# Ver ficheiros alterados
git diff --name-only main...feature-branch
```

---

## 🔀 Merge

### Fazer Merge

```bash
# Merge de branch para a atual
git checkout main
git merge feature-branch

# Merge sem fast-forward (cria commit de merge)
git merge --no-ff feature-branch

# Abortar merge
git merge --abort
```

### Resolver Conflitos

```bash
# Ver ficheiros com conflito
git status

# Aceitar versão deles (theirs)
git checkout --theirs arquivo.R

# Aceitar nossa versão (ours)
git checkout --ours arquivo.R

# Após resolver manualmente
git add arquivo-resolvido.R
git commit -m "Resolver conflito"
```

---

## 🎯 Stash (Guardar Temporariamente)

```bash
# Guardar alterações
git stash
git stash save "Mensagem descritiva"

# Listar stashes
git stash list

# Aplicar último stash
git stash pop               # Aplica e remove
git stash apply             # Aplica mas mantém

# Aplicar stash específico
git stash apply stash@{2}

# Ver conteúdo do stash
git stash show -p

# Apagar stash
git stash drop
git stash clear             # Apagar todos
```

---

## ↩️ Desfazer Alterações

### Ficheiros Não Commitados

```bash
# Descartar alterações num ficheiro
git checkout -- arquivo.R
git restore arquivo.R       # Forma moderna

# Descartar todas as alterações
git checkout -- .
git restore .

# Remover ficheiros untracked
git clean -n                # Preview
git clean -f                # Executar
```

### Reverter Commits

```bash
# Reverter commit específico (cria novo commit)
git revert abc123

# Reverter vários commits
git revert HEAD~3..HEAD

# Voltar para commit específico (apaga histórico)
git reset --hard abc123     # ⚠️ Perigoso!
```

---

## 🏷️ Tags

```bash
# Criar tag
git tag v1.0.0
git tag -a v1.0.0 -m "Versão 1.0.0"

# Listar tags
git tag

# Push de tags
git push origin v1.0.0
git push --tags             # Todas as tags

# Apagar tag
git tag -d v1.0.0
git push origin --delete v1.0.0
```

---

## 🔍 Pesquisa

```bash
# Procurar no código
git grep "função"
git grep -n "função"        # Com números de linha
git grep "função" -- "*.R"  # Só em ficheiros .R

# Procurar em commits
git log --grep="análise"
git log -S"função"          # Commits que mudaram "função"
```

---

## 🛠️ Utilitários

### Alias

```bash
# Criar atalhos
git config --global alias.st status
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.cm commit
git config --global alias.lg "log --oneline --graph --all"

# Usar
git st
git lg
```

### Informação

```bash
# Ver remoto de uma branch
git remote show origin

# Ver tracking branches
git branch -vv

# Ver tamanho do repositório
git count-objects -vH
```

---

## 🚨 Situações de Emergência

### Recuperar Commits Perdidos

```bash
# Ver histórico de referências
git reflog

# Recuperar commit
git checkout abc123
git cherry-pick abc123
```

### Limpar Histórico

```bash
# Remover ficheiro de todo o histórico
git filter-branch --tree-filter 'rm -f senha.txt' HEAD

# Ou usar BFG (mais rápido)
# Descarregar de: https://rtyley.github.io/bfg-repo-cleaner/
```

### Sincronizar Fork

```bash
# Adicionar upstream
git remote add upstream https://github.com/original/repo.git

# Atualizar
git fetch upstream
git checkout main
git merge upstream/main
git push origin main
```

---

## 📋 Cheatsheet de Uma Página

### Setup
```bash
git config --global user.name "Nome"
git config --global user.email "email@exemplo.com"
```

### Workflow Básico
```bash
git clone <url>              # Clonar
git status                   # Ver estado
git add .                    # Adicionar tudo
git commit -m "msg"          # Commit
git push                     # Enviar
git pull                     # Obter
```

### Branches
```bash
git checkout -b feature      # Criar branch
git checkout main            # Mudar branch
git merge feature            # Merge
git branch -d feature        # Apagar
```

### Desfazer
```bash
git restore arquivo.R        # Descartar alterações
git reset --soft HEAD~1      # Desfazer commit
git revert HEAD              # Reverter commit
```

### Ver Histórico
```bash
git log --oneline            # Histórico resumido
git diff                     # Ver diferenças
git blame arquivo.R          # Autoria
```

---

## 💡 Dicas Rápidas

### DO ✅

- `git pull` antes de começar a trabalhar
- `git status` frequentemente
- Mensagens de commit descritivas
- Commits pequenos e focados
- Push regular (backup!)

### DON'T ❌

- `git push --force` em branches partilhadas
- Commits com código que não funciona
- Guardar passwords no Git
- Branches com vida muito longa
- `git add .` sem verificar o que estás a adicionar

---

## 📱 Recursos Online

- [Git Cheat Sheet (GitHub)](https://education.github.com/git-cheat-sheet-education.pdf)
- [Visual Git Cheat Sheet](https://ndpsoftware.com/git-cheatsheet.html)
- [Git Flight Rules](https://github.com/k88hudson/git-flight-rules) - Como resolver problemas

---

**Dica**: Imprime esta página e mantém perto do teu computador! 📄

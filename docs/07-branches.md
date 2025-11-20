# O que são Branches

Branches (ramos) são uma das funcionalidades mais poderosas do Git. Permitem-te trabalhar em funcionalidades novas sem afetar o código principal.

## 🎯 Objetivos

Neste módulo vais aprender:
- O que são branches e porquê usá-las
- Como criar e mudar entre branches
- Ver e gerir branches
- Boas práticas de naming

---

## 🌳 Analogia: Árvore de Desenvolvimento

Imagina o teu projeto como uma árvore:

```
                    feature-graficos
                   /
main   A---B---C---D---E---F
                \     \
                 \     feature-relatorio
                  \
                   bugfix-calculo
```

- **main**: O tronco principal (código estável, em produção)
- **feature-graficos**: Ramo para desenvolver novos gráficos
- **feature-relatorio**: Ramo para criar relatório Quarto
- **bugfix-calculo**: Ramo para corrigir um bug

**Cada branch** permite trabalhar isoladamente sem afetar as outras!

---

## 🤔 Porquê Usar Branches?

### Sem Branches (Problemático)

```
Cenário: Ana e Bruno trabalham direto na main

main: A---B(Ana)---C(Bruno-bug!)---D(Ana-fix?)---E(Bruno)...

Problemas:
- Código instável na main
- Dificil ver o que mudou
- Commits misturados
- Dificil reverter só uma funcionalidade
```

### Com Branches (Organizado!)

```
main:           A---B-----------merge--------------G
                     \         /                  /
feature-ana:          C---D---E                  /
                                                /
feature-bruno:                    F-----------
```

**Vantagens**:
✅ Main está sempre estável
✅ Cada feature desenvolvida isoladamente
✅ Fácil testar antes de juntar
✅ Fácil desfazer uma feature completa
✅ Histórico organizado

---

## 📚 Conceitos de Branches

### Branch Main (ou Master)

- **Branch principal** do projeto
- Deve conter código **estável e testado**
- Em produção ou pronto para produção
- Muitos projetos protegem esta branch (não aceita commits diretos)

### Feature Branches

- Branches para desenvolver **novas funcionalidades**
- Exemplos:
  - `feature-analise-regional`
  - `feature-dashboard`
  - `adicionar-graficos`

### Bugfix Branches

- Para **corrigir bugs**
- Exemplos:
  - `bugfix-calculo-total`
  - `fix-data-import`

### Outras Convenções

- `hotfix-*`: Correções urgentes para produção
- `refactor-*`: Refatoração de código
- `docs-*`: Atualizações de documentação
- `test-*`: Adicionar ou corrigir testes

---

## 🔧 Comandos Básicos de Branches

### Ver branches existentes

```bash
# Listar branches locais
git branch

# Listar todas (incluindo remotas)
git branch -a

# Listar com último commit
git branch -v
```

**Output exemplo**:
```
* main
  feature-analise
  bugfix-data
```

O `*` indica a branch atual.

### Criar nova branch

```bash
# Criar branch (mas não mudar para ela)
git branch nome-da-branch

# Criar E mudar para a branch
git checkout -b nome-da-branch

# Forma moderna (Git 2.23+)
git switch -c nome-da-branch
```

**Exemplo prático**:
```bash
# Vou trabalhar em análise regional
git checkout -b feature-analise-regional

# Output:
# Switched to a new branch 'feature-analise-regional'
```

### Mudar de branch

```bash
# Forma clássica
git checkout nome-da-branch

# Forma moderna
git switch nome-da-branch

# Voltar para a main
git checkout main
```

**⚠️ Importante**: Faz commit ou stash das alterações antes de mudar de branch!

### Apagar branch

```bash
# Apagar branch local (só se já fez merge)
git branch -d nome-da-branch

# Forçar apagar (mesmo sem merge)
git branch -D nome-da-branch

# Apagar branch remota
git push origin --delete nome-da-branch
```

---

## 🎯 Workflow com Branches

### Passo a Passo Completo

**1. Começar com main atualizada**:
```bash
git checkout main
git pull
```

**2. Criar branch para a tua tarefa**:
```bash
git checkout -b feature-analise-regional
```

**3. Trabalhar normalmente**:
```bash
# Editar ficheiros
git add scripts/analise-regional.R
git commit -m "Implementar análise de vendas por região"

# Mais trabalho
git add scripts/analise-regional.R
git commit -m "Adicionar visualização regional"
```

**4. Enviar branch para o GitHub**:
```bash
git push -u origin feature-analise-regional
```

**5. Continuar a trabalhar** (se necessário):
```bash
# Mais commits
git add .
git commit -m "Melhorar formatação da visualização"
git push  # Já está configurado o upstream
```

**6. Quando terminar**: Abrir Pull Request no GitHub (próximo módulo!)

---

## 🔀 Ver Diferenças Entre Branches

```bash
# Ver que commits tem uma branch que outra não tem
git log main..feature-analise-regional

# Ver diferenças nos ficheiros
git diff main...feature-analise-regional

# Ver só nomes dos ficheiros diferentes
git diff --name-only main...feature-analise-regional
```

---

## 🎨 Convenções de Nomes

### Boas Práticas

✅ **Bom**:
```bash
feature-analise-regional
bugfix-calculo-total
docs-update-readme
refactor-data-processing
```

**Características**:
- Minúsculas
- Palavras separadas por hífen `-`
- Descritivo e específico
- Prefixo indica tipo (feature, bugfix, etc.)

❌ **Evitar**:
```bash
nova_branch          # Pouco descritivo
MinhaFeature         # CamelCase não é padrão
feature/teste        # '/' pode causar problemas
branch-temporaria    # Não diz o que faz
```

### Convenções Comuns

| Prefixo | Uso | Exemplo |
|---------|-----|---------|
| `feature-` | Nova funcionalidade | `feature-dashboard` |
| `bugfix-` | Correção de bug | `bugfix-import-error` |
| `hotfix-` | Correção urgente | `hotfix-security-patch` |
| `refactor-` | Refatoração | `refactor-clean-code` |
| `docs-` | Documentação | `docs-api-guide` |
| `test-` | Testes | `test-add-unit-tests` |
| `chore-` | Manutenção | `chore-update-deps` |

---

## 🎯 Exercício Prático

### Objetivo
Criar branches, trabalhar nelas, e mudar entre branches.

### Parte 1: Criar Branch para Análise

```bash
# 1. Garantir que estás na main
git checkout main
git pull

# 2. Criar branch para análise regional
git checkout -b feature-analise-regional

# 3. Editar scripts/03-analise.R
# Adicionar este código:
```

```r
# Análise Regional
vendas_por_regiao <- vendas %>%
  group_by(regiao) %>%
  summarise(
    total_vendas = sum(valor_total),
    media_vendas = mean(valor_total),
    num_transacoes = n()
  ) %>%
  arrange(desc(total_vendas))

print(vendas_por_regiao)
```

```bash
# 4. Fazer commit
git add scripts/03-analise.R
git commit -m "Adicionar análise agregada por região"

# 5. Push da branch
git push -u origin feature-analise-regional
```

### Parte 2: Criar Outra Branch

```bash
# 1. Voltar para main
git checkout main

# 2. Criar branch para visualização
git checkout -b feature-visualizacao-vendas

# 3. Editar scripts/04-visualizacao.R
# Completar o código de um dos gráficos

# 4. Commit e push
git add scripts/04-visualizacao.R
git commit -m "Implementar gráfico de vendas por região"
git push -u origin feature-visualizacao-vendas
```

### Parte 3: Alternar Entre Branches

```bash
# Ver que branches tens
git branch

# Mudar para a branch de análise
git checkout feature-analise-regional

# Ver o ficheiro - tem a análise regional
cat scripts/03-analise.R

# Mudar para a branch de visualização
git checkout feature-visualizacao-vendas

# Ver o ficheiro - tem a visualização
cat scripts/04-visualizacao.R

# Mudar para main
git checkout main

# Ver os ficheiros - não têm as alterações!
# (estão só nas branches)
```

---

## 🔍 Visualizar Histórico de Branches

### No terminal

```bash
# Ver árvore de commits
git log --graph --oneline --all

# Versão mais detalhada
git log --graph --decorate --oneline --all
```

**Output exemplo**:
```
* a1b2c3d (feature-visualizacao) Adicionar gráfico
| * d4e5f6g (feature-analise) Adicionar análise regional
|/
* g7h8i9j (HEAD -> main, origin/main) Initial commit
```

### No GitHub

1. Vai ao repositório no GitHub
2. Clica em "Insights" → "Network"
3. Vês visualização gráfica de todas as branches

---

## ⚠️ Problemas Comuns

### Erro: "Please commit your changes or stash them"

**Causa**: Tens alterações não commitadas e queres mudar de branch.

**Solução 1 - Commit**:
```bash
git add .
git commit -m "WIP: trabalho em progresso"
git checkout outra-branch
```

**Solução 2 - Stash**:
```bash
# Guardar alterações temporariamente
git stash

# Mudar de branch
git checkout outra-branch

# Trabalhar...

# Voltar e restaurar
git checkout branch-original
git stash pop
```

### Branch desatualizada com main

**Problema**: Trabalhaste na branch durante dias, main tem novos commits.

**Solução - Atualizar a branch**:
```bash
# Na tua feature branch
git checkout feature-analise-regional

# Obter últimas alterações da main
git fetch origin
git merge origin/main

# Ou usando rebase (histórico mais limpo)
git rebase origin/main

# Resolver conflitos se houver
# Push das alterações
git push
```

---

## 🎓 Boas Práticas

### DO ✅

1. **Uma branch = uma funcionalidade/tarefa**
   ```bash
   # Bom
   feature-analise-regional  # Só análise regional
   feature-graficos-vendas   # Só gráficos

   # Mau
   feature-varias-coisas  # Análise + gráficos + correções
   ```

2. **Branches de curta duração**
   - Idealmente, branch vive 1-3 dias
   - Fazer merge frequentemente
   - Evita conflitos grandes

3. **Nome descritivo**
   ```bash
   feature-dashboard-vendas  ✅
   minha-branch             ❌
   ```

4. **Criar branch a partir da main atualizada**
   ```bash
   git checkout main
   git pull
   git checkout -b nova-feature
   ```

5. **Commits regulares na branch**
   - Não esperar terminar tudo
   - Push regular (backup!)

### DON'T ❌

1. **Trabalhar direto na main**
   - Usa sempre branches!

2. **Branches com vida muito longa**
   - Aumenta risco de conflitos
   - Dificulta integração

3. **Criar branch de outra feature branch**
   ```bash
   # Evitar
   git checkout feature-a
   git checkout -b feature-b  # Depende de feature-a!

   # Preferir
   git checkout main
   git checkout -b feature-b
   ```

---

## ✅ Checklist

Antes de avançar, confirma que sabes:

- [ ] O que é uma branch
- [ ] Criar branch: `git checkout -b nome`
- [ ] Mudar de branch: `git checkout nome`
- [ ] Ver branches: `git branch`
- [ ] Apagar branch: `git branch -d nome`
- [ ] Push de branch: `git push -u origin nome`
- [ ] Convenções de nomes de branches
- [ ] Quando usar branches

---

## 🎉 Próximo Passo

Agora que sabes criar e gerir branches, vamos aprender a [usar branches no Positron e GitHub](08-criar-branch.md) com exemplos práticos!

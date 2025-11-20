# Push e Pull: Sincronização com o GitHub

Aprendeste a fazer commits localmente. Agora vamos aprofundar como sincronizar o teu trabalho com o GitHub e colaborar com outros.

## 🎯 Objetivos

Neste módulo vais aprender:
- O que fazem `git push` e `git pull`
- Quando usar cada comando
- Como resolver problemas comuns de sincronização
- Trabalhar com repositórios remotos

---

## 🌐 Repositórios Local vs Remoto

É importante entender que tens **dois repositórios**:

```
┌─────────────────────────────────┐
│  💻 Repositório LOCAL           │
│  (no teu computador)            │
│                                  │
│  Commits aqui ficam só teus     │
│  até fazeres push               │
└──────────────┬──────────────────┘
               │
               │  git push ↑
               │  git pull ↓
               │
┌──────────────▼──────────────────┐
│  ☁️  Repositório REMOTO         │
│  (no GitHub)                    │
│                                  │
│  Visível para toda a equipa     │
└─────────────────────────────────┘
```

---

## 📤 Git Push: Enviar Commits

### O que faz?

`git push` envia os teus commits locais para o GitHub.

**Comando básico**:
```bash
git push
```

**Forma completa** (normalmente não precisas):
```bash
git push origin main
```

Onde:
- `origin`: Nome do repositório remoto (padrão)
- `main`: Nome da branch

### Quando usar?

✅ **Usa push quando**:
- Completaste uma tarefa/funcionalidade
- Queres fazer backup do teu trabalho
- Queres partilhar código com a equipa
- Ao fim do dia de trabalho

❌ **NÃO faças push**:
- De código que não compila
- De commits incompletos (usa branches!)
- Com dados sensíveis (passwords, tokens)

### O que acontece durante o push?

```
ANTES do push:
Local:   A---B---C---D  (main)
                     ↑ HEAD

Remote:  A---B---C      (origin/main)


DEPOIS do push:
Local:   A---B---C---D  (main)
                     ↑ HEAD

Remote:  A---B---C---D  (origin/main)
                     ↑ Agora sincronizado!
```

---

## 📥 Git Pull: Obter Commits

### O que faz?

`git pull` traz commits do GitHub para o teu repositório local.

**Comando básico**:
```bash
git pull
```

**O que realmente faz**:
```bash
# git pull é equivalente a:
git fetch    # Descarregar alterações
git merge    # Juntar com o teu trabalho local
```

### Quando usar?

✅ **Usa pull quando**:
- Começas a trabalhar (início do dia)
- Antes de criar uma nova branch
- Colegas fizeram push de alterações
- Antes de fazer merge de branches

❌ **Cuidado**:
- Se tens alterações não commitadas, faz commit ou stash primeiro

### O que acontece durante o pull?

**Cenário 1: Fast-forward (simples)**

```
ANTES do pull:
Local:   A---B---C      (main)
                  ↑ HEAD

Remote:  A---B---C---D---E  (origin/main)


DEPOIS do pull:
Local:   A---B---C---D---E  (main)
                         ↑ HEAD
```

**Cenário 2: Merge necessário**

```
ANTES do pull:
Local:   A---B---C---X     (main, o teu trabalho)
                      ↑ HEAD

Remote:  A---B---C---Y     (origin/main, trabalho de colega)


DEPOIS do pull (merge automático):
Local:   A---B---C---X---M  (main)
              \     /   ↑ HEAD (merge commit)
               ---Y---
```

---

## 🔄 Workflow Típico de Sincronização

### Início do dia

```bash
# 1. Ver estado atual
git status

# 2. Obter últimas alterações
git pull

# 3. Começar a trabalhar!
```

### Durante o trabalho

```bash
# Fazer alterações...

# Commit regularmente
git add .
git commit -m "Implementar análise regional"

# Mais alterações...
git add .
git commit -m "Adicionar visualização"
```

### Fim do dia (ou tarefa completa)

```bash
# 1. Commit final se houver alterações
git status
git add .
git commit -m "Finalizar relatório de vendas"

# 2. Obter últimas alterações (caso alguém tenha feito push)
git pull

# 3. Enviar o teu trabalho
git push
```

---

## 🔍 Comandos Úteis

### Ver repositórios remotos

```bash
# Listar remotos
git remote -v
```

**Output esperado**:
```
origin  https://github.com/TEU-USERNAME/r-github-tutorial.git (fetch)
origin  https://github.com/TEU-USERNAME/r-github-tutorial.git (push)
```

### Ver diferenças com o remoto

```bash
# Ver commits que tens localmente mas não no remoto
git log origin/main..HEAD

# Ver commits no remoto que não tens localmente
git log HEAD..origin/main
```

### Fetch vs Pull

```bash
# Só descarregar (não fazer merge)
git fetch

# Ver o que mudou sem aplicar
git log HEAD..origin/main

# Decidir se queres fazer merge
git merge origin/main
```

---

## ⚠️ Problemas Comuns e Soluções

### Problema 1: "Updates were rejected"

**Mensagem de erro**:
```
! [rejected]        main -> main (non-fast-forward)
error: failed to push some refs
```

**Causa**: Há commits no GitHub que não tens localmente.

**Solução**:
```bash
# 1. Obter alterações do remoto
git pull

# 2. Resolver conflitos se houver (vê próximo módulo)

# 3. Tentar push novamente
git push
```

### Problema 2: Conflitos de merge durante pull

**Mensagem**:
```
CONFLICT (content): Merge conflict in analise.R
Automatic merge failed; fix conflicts and then commit
```

**Solução**:

1. **Abre o ficheiro com conflito**:
   ```r
   <<<<<<< HEAD
   # O teu código
   total <- sum(vendas$valor)
   =======
   # Código do colega
   total_vendas <- sum(vendas$valor_total)
   >>>>>>> origin/main
   ```

2. **Escolhe a versão correta** (ou combina ambas):
   ```r
   # Versão final
   total_vendas <- sum(vendas$valor_total)
   ```

3. **Marca como resolvido e faz commit**:
   ```bash
   git add analise.R
   git commit -m "Resolver conflito de merge em analise.R"
   git push
   ```

**Dica**: Vamos ver conflitos em muito mais detalhe no módulo [Resolver Conflitos](10-merge-conflicts.md).

### Problema 3: Alterações não commitadas durante pull

**Mensagem**:
```
error: Your local changes would be overwritten by merge.
Please commit your changes or stash them before you merge.
```

**Solução 1 - Fazer commit**:
```bash
git add .
git commit -m "WIP: trabalho em progresso"
git pull
```

**Solução 2 - Stash (guardar temporariamente)**:
```bash
# Guardar alterações
git stash

# Fazer pull
git pull

# Restaurar alterações
git stash pop
```

### Problema 4: Push do ficheiro errado

**Se ainda NÃO fizeste push**:
```bash
# Desfazer último commit (mantém alterações)
git reset --soft HEAD~1

# Re-fazer commit correto
git add ficheiro-certo.R
git commit -m "Mensagem correta"
git push
```

**Se JÁ fizeste push**:
```bash
# Criar novo commit que remove o ficheiro
git rm ficheiro-errado.txt
git commit -m "Remover ficheiro acidental"
git push
```

⚠️ **Importante**: Nunca uses `git push --force` sem ter a certeza do que estás a fazer!

---

## 🎯 Exercício Prático

Vamos praticar push e pull com um exercício simples.

### Parte 1: Trabalhar Localmente

1. **Abre o script** `scripts/01-importar-dados.R`

2. **Adiciona comentários explicativos**:
   ```r
   # ============================================================================
   # Script 1: Importar e Explorar Dados
   # ============================================================================
   # Este script faz a importação inicial dos dados de vendas
   # e apresenta estatísticas descritivas básicas
   # ============================================================================
   ```

3. **Faz commit**:
   ```bash
   git add scripts/01-importar-dados.R
   git commit -m "Adicionar cabeçalho ao script de importação"
   ```

4. **Verifica o estado**:
   ```bash
   git status
   git log --oneline -3
   ```

### Parte 2: Sincronizar com GitHub

1. **Antes de fazer push, simula que alguém alterou algo**:
   - Vai ao GitHub web
   - Edita o README.md diretamente (clica no lápis)
   - Adiciona uma linha: `## Últimas Atualizações`
   - Commit direto no GitHub: "Adicionar secção de atualizações"

2. **Tenta fazer push localmente**:
   ```bash
   git push
   ```

   ❌ Vais receber erro! Porquê? Porque há alterações no remoto que não tens localmente.

3. **Faz pull primeiro**:
   ```bash
   git pull
   ```

   ✅ O Git faz merge automático (não há conflitos)

4. **Agora faz push**:
   ```bash
   git push
   ```

   ✅ Sucesso!

5. **Verifica no GitHub**:
   - Ambas as alterações (a tua e a do web) estão lá
   - Vês um commit de merge automático

---

## 📊 Ver Diferenças Antes de Pull/Push

### Antes de fazer push

```bash
# Ver que commits vais enviar
git log origin/main..HEAD

# Ver alterações específicas
git diff origin/main
```

### Antes de fazer pull

```bash
# Primeiro, atualizar informação do remoto
git fetch

# Ver que commits vais receber
git log HEAD..origin/main

# Ver alterações específicas
git diff origin/main
```

---

## 🎓 Melhores Práticas

### DO ✅

1. **Pull frequentemente**
   ```bash
   # Início do dia
   git pull

   # Antes de criar branch
   git pull

   # Antes de fazer merge
   git pull
   ```

2. **Commit antes de pull**
   - Mantém o histórico limpo
   - Evita perder trabalho

3. **Push regularmente**
   - Fim do dia
   - Após completar tarefa
   - Funcionalidade completa

4. **Verificar antes de push**
   ```bash
   git status
   git log --oneline -5
   ```

### DON'T ❌

1. **Nunca fazer `push --force` em branches partilhadas**
   - Podes destruir trabalho de colegas!

2. **Não fazer pull com alterações não commitadas**
   - Commit ou stash primeiro

3. **Não acumular muitos commits sem push**
   - Aumenta risco de conflitos

---

## 🔐 Trabalhar com Múltiplos Remotos

Às vezes precisas de trabalhar com mais que um remoto.

### Adicionar upstream (repositório original)

Se fizeste fork:

```bash
# Adicionar o repositório original como upstream
git remote add upstream https://github.com/ruimgbarros/r-github-tutorial.git

# Verificar remotos
git remote -v
```

**Output**:
```
origin    https://github.com/TEU-USERNAME/r-github-tutorial.git (fetch)
origin    https://github.com/TEU-USERNAME/r-github-tutorial.git (push)
upstream  https://github.com/ruimgbarros/r-github-tutorial.git (fetch)
upstream  https://github.com/ruimgbarros/r-github-tutorial.git (push)
```

### Sincronizar com upstream

```bash
# Obter alterações do repositório original
git fetch upstream

# Fazer merge com a tua branch
git merge upstream/main

# Enviar para o teu fork
git push origin main
```

---

## ✅ Checklist de Conhecimentos

Antes de avançar, confirma que sabes:

- [ ] O que faz `git push`
- [ ] O que faz `git pull`
- [ ] Diferença entre `git fetch` e `git pull`
- [ ] Como resolver "updates were rejected"
- [ ] Workflow: pull → trabalhar → commit → pull → push
- [ ] Como ver diferenças com o remoto
- [ ] Quando NÃO usar `push --force`

---

## 🎉 Próximo Passo

Ótimo! Agora sabes sincronizar o teu trabalho com o GitHub.

No próximo módulo, vamos aprender sobre [Trabalho Colaborativo](06-trabalho-colaborativo.md) e como várias pessoas trabalham no mesmo repositório.

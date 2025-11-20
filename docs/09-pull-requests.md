# Pull Requests

Pull Requests (ou PRs) são o mecanismo para propor alterações e integrá-las na branch principal após revisão.

## 🎯 Objetivos

- Entender o que é um Pull Request
- Criar um PR no GitHub
- Rever PRs de colegas
- Fazer merge de PRs
- Boas práticas de PRs

---

## 🤔 O que é um Pull Request?

Um **Pull Request** é um pedido para integrar (merge) as alterações de uma branch noutra.

### Analogia

Imagina que estás a escrever um relatório em equipa:

1. **Tu escreves** uma secção num documento separado
2. **Pedes revisão** aos colegas: "Podem rever esta secção?"
3. **Colegas comentam**: "Alterar aqui", "Excelente análise!"
4. **Fazes ajustes** baseados no feedback
5. **Aprovam e integram** no relatório principal

**Pull Request faz exatamente isto com código!**

---

## 🔄 Workflow Completo com PR

```
1. Criar branch
   git checkout -b feature-analise

2. Fazer commits
   git commit -m "..."
   git push

3. Abrir Pull Request no GitHub
   "Quero juntar feature-analise → main"

4. Revisão de código
   Colegas comentam e sugerem alterações

5. Fazer ajustes
   Mais commits na mesma branch

6. Aprovação
   Colega aprova o PR

7. Merge
   Alterações integradas na main

8. Apagar branch
   Branch feature-analise já não é necessária
```

---

## 📝 Criar um Pull Request

### Pré-requisitos

Tens uma branch com commits que queres integrar na main:

```bash
# Confirmar que fizeste push da branch
git checkout feature-analise-regional
git push -u origin feature-analise-regional
```

### Método 1: Banner Automático (Mais Fácil!)

1. **Vai ao repositório** no GitHub
2. **Vês banner amarelo**:
   > `feature-analise-regional` had recent pushes
   > [Compare & pull request]
3. **Clica "Compare & pull request"**

### Método 2: Manualmente

1. **Vai ao repositório** no GitHub
2. **Clica em "Pull requests"**
3. **Clica "New pull request"**
4. **Seleciona branches**:
   - base: `main` (para onde vais merge)
   - compare: `feature-analise-regional` (a tua branch)
5. **Clica "Create pull request"**

### Preencher o PR

**Título**: Descritivo e claro
```
✅ Bom:
"Adicionar análise de vendas por região"

❌ Mau:
"Atualização"
"Changes"
```

**Descrição**: Explicar o que mudou e porquê

Template exemplo:
```markdown
## O que mudou

Implementei análise agregada de vendas por região, incluindo:
- Total de vendas por região
- Média de vendas
- Número de transações

## Por que mudou

Precisamos desta análise para o relatório trimestral do DataH.

## Como testar

```r
source("scripts/01-importar-dados.R")
source("scripts/03-analise.R")
```

## Screenshots / Outputs

[Incluir imagem ou output esperado]

## Checklist

- [x] Código testado localmente
- [x] Comentários adicionados onde necessário
- [x] Sem erros ou warnings
- [ ] Aprovado por: (nome do revisor)
```

**Opções**:
- **Reviewers**: Selecionar quem deve rever
- **Assignees**: Quem é responsável pelo PR
- **Labels**: Tags como `enhancement`, `bug`, `documentation`
- **Projects**: Associar a projeto de gestão

**Clica "Create pull request"** ✅

---

## 👀 Rever um Pull Request

### Ver as Alterações

**Aba "Files changed"**:
- **Verde** (+): Linhas adicionadas
- **Vermelho** (-): Linhas removidas
- **Sem cor**: Contexto (não mudou)

### Fazer Comentários

**Comentário geral**:
1. Escreve na caixa em baixo
2. Clica "Comment"

**Comentário numa linha específica**:
1. Paira o rato sobre a linha
2. Clica no ícone **+** azul
3. Escreve comentário
4. Opções:
   - **Single comment**: Comentário simples
   - **Start a review**: Agrupa vários comentários

### Tipos de Feedback

**Sugestão de código**:
```markdown
```suggestion
total_vendas <- sum(vendas$valor_total, na.rm = TRUE)
```
```

O autor pode clicar "Commit suggestion" para aplicar diretamente!

**Pedir esclarecimento**:
> Porque usaste `filter()` em vez de `subset()` aqui?

**Aprovar ou Pedir Alterações**:
1. Clica "Review changes"
2. Escolhe:
   - **Comment**: Apenas comentário
   - **Approve**: Aprovar PR ✅
   - **Request changes**: Pedir alterações ❌
3. Escreve resumo da revisão
4. "Submit review"

---

## 🔧 Responder a Comentários

### Fazer Alterações Solicitadas

Os comentários pedem ajustes. Faz alterações **na mesma branch**:

```bash
# Já estás na branch feature-analise-regional

# Fazer as alterações pedidas
# Editar scripts/03-analise.R

git add scripts/03-analise.R
git commit -m "Aplicar sugestões da revisão: usar na.rm = TRUE"
git push
```

✅ **O PR atualiza automaticamente** com os novos commits!

### Responder a Comentários

Na thread do comentário:
- Escreve resposta
- Se corrigiste: "Corrigido em [commit abc123]"
- Se discordas: Explica porquê (educadamente!)
- Clica "Resolve conversation" quando estiver resolvido

---

## ✅ Aprovar e Fazer Merge

### Quando Fazer Merge?

✅ **Sim, se**:
- [ ] Aprovado por pelo menos 1 revisor
- [ ] Todos os comentários resolvidos
- [ ] Checks automáticos passaram (se houver CI/CD)
- [ ] Código testado
- [ ] Branch atualizada com main (sem conflitos)

### Tipos de Merge

Quando clicas "Merge pull request", tens 3 opções:

**1. Create a merge commit** (padrão)
```
main:  A---B---------M
            \       /
feature:     C---D-E
```
- Mantém todo o histórico
- Cria commit de merge
- Recomendado para iniciantes

**2. Squash and merge**
```
main:  A---B---CDE
            \
feature:     C---D---E (será apagada)
```
- Junta todos os commits num só
- Histórico mais limpo
- Perde histórico detalhado da branch

**3. Rebase and merge**
```
main:  A---B---C'---D'---E'
```
- Reescreve commits sobre a main
- Histórico linear
- Mais avançado

**Para este tutorial, usa "Create a merge commit".**

### Fazer o Merge

1. **Clica "Merge pull request"**
2. **Confirma o merge**
3. **Clica "Confirm merge"**

✅ **PR merged!** Vês:
- Estado muda para "Merged"
- Botão para apagar a branch: "Delete branch"

### Limpar Branches

**No GitHub**:
- Clica "Delete branch" após merge

**Localmente**:
```bash
# Mudar para main
git checkout main

# Atualizar main
git pull

# Apagar branch local
git branch -d feature-analise-regional

# Verificar que a análise está na main
cat scripts/03-analise.R
```

✅ As alterações estão na main, branch pode ser apagada!

---

## 🎯 Exercício Completo de PR

### Cenário

Vais criar uma análise completa e submetê-la via PR.

### Parte 1: Criar Branch e Código

```bash
# 1. Criar branch
git checkout main
git pull
git checkout -b analise-vendedor

# 2. Editar scripts/03-analise.R, adicionar:
```

```r
# ============================================================================
# Análise: Performance por Vendedor
# ============================================================================

performance_vendedor <- vendas %>%
  group_by(vendedor, regiao) %>%
  summarise(
    total_vendas = sum(valor_total),
    num_transacoes = n(),
    ticket_medio = mean(valor_total),
    .groups = "drop"
  ) %>%
  arrange(desc(total_vendas))

print("=== Performance por Vendedor ===")
print(performance_vendedor)

# Top vendedor
top_vendedor <- performance_vendedor %>%
  slice(1)

print(paste0("Top vendedor: ", top_vendedor$vendedor,
             " (Região: ", top_vendedor$regiao, ")"))
```

```bash
# 3. Testar
Rscript -e "source('scripts/01-importar-dados.R'); source('scripts/03-analise.R')"

# 4. Commit e push
git add scripts/03-analise.R
git commit -m "Adicionar análise de performance por vendedor"
git push -u origin analise-vendedor
```

### Parte 2: Criar PR

1. Vai ao GitHub
2. Clica "Compare & pull request"
3. Preenche:
   - **Título**: "Adicionar análise de performance por vendedor"
   - **Descrição**:
     ```markdown
     ## O que mudou
     Nova análise mostrando performance de cada vendedor por região.

     ## Métricas incluídas
     - Total de vendas
     - Número de transações
     - Ticket médio
     - Identificação do top vendedor

     ## Como testar
     ```r
     source("scripts/01-importar-dados.R")
     source("scripts/03-analise.R")
     ```

     ## Output esperado
     Tabela com performance de 3 vendedores e identificação do top.
     ```
4. Assignees: tu mesmo
5. Labels: `enhancement`
6. Create pull request

### Parte 3: Simular Revisão

Se estás a trabalhar sozinho:

1. **Abre o PR que criaste**
2. **Vai a "Files changed"**
3. **Adiciona comentário** numa linha:
   - Clica no + ao lado de uma linha
   - Escreve: "Boa adição! Sugestão: adicionar também produto mais vendido por vendedor."
   - "Add single comment"

4. **Responde ao comentário** (como autor):
   - "Boa ideia! Vou adicionar."

### Parte 4: Fazer Alteração

```bash
# Adicionar análise de produto por vendedor
# Editar scripts/03-analise.R
```

```r
# Produto mais vendido por vendedor
produto_top_vendedor <- vendas %>%
  group_by(vendedor, produto) %>%
  summarise(total = sum(valor_total), .groups = "drop") %>%
  group_by(vendedor) %>%
  slice_max(total, n = 1) %>%
  select(vendedor, produto_top = produto, valor_top = total)

performance_vendedor <- performance_vendedor %>%
  left_join(produto_top_vendedor, by = "vendedor")

print(performance_vendedor)
```

```bash
git add scripts/03-analise.R
git commit -m "Adicionar produto top por vendedor"
git push
```

### Parte 5: Aprovar e Merge

1. Volta ao PR no GitHub
2. Vês o novo commit aparecer automaticamente
3. "Resolve conversation" no comentário
4. Clica "Merge pull request"
5. Confirma
6. Delete branch

### Parte 6: Atualizar Local

```bash
git checkout main
git pull
git branch -d analise-vendedor

# Verificar que está tudo na main
git log --oneline -5
```

✅ **Exercício completo!**

---

## 🎨 Boas Práticas de PRs

### DO ✅

**1. PRs pequenos e focados**
```
✅ Bom:
PR #1: Adicionar análise regional (50 linhas)
PR #2: Adicionar gráficos (30 linhas)

❌ Mau:
PR #1: Análise + gráficos + relatório + refactor (500 linhas)
```

**2. Título e descrição claros**
- O que mudou
- Porquê mudou
- Como testar

**3. Self-review antes de submeter**
- Rever o próprio código no GitHub
- Remover debugs e comentários temporários

**4. Responder prontamente a comentários**
- Verificar notificações
- Responder em 24h

**5. Agradecer revisores**
- "Obrigado pela revisão!"
- "Boa sugestão, aplicada!"

### DON'T ❌

**1. PRs enormes**
- Difíceis de rever
- Mais propensos a bugs

**2. Forçar merge sem aprovação**
- Sempre pedir revisão

**3. Ignorar comentários**
- Discussão saudável faz código melhor

**4. PRs com código que não funciona**
- Testar sempre antes

---

## ✅ Checklist de PR

Antes de criar PR:
- [ ] Código funciona localmente
- [ ] Commits com mensagens claras
- [ ] Branch atualizada com main
- [ ] Removido código debug/temporário
- [ ] Adicionados comentários onde necessário

Ao criar PR:
- [ ] Título descritivo
- [ ] Descrição completa
- [ ] Reviewers atribuídos
- [ ] Labels aplicadas

Antes de merge:
- [ ] Aprovado por revisor
- [ ] Comentários resolvidos
- [ ] Sem conflitos com main
- [ ] Checks passaram (se houver)

---

## 🎉 Próximo Passo

Ótimo! Agora sabes criar e rever PRs.

O último tópico essencial é aprender a [Resolver Conflitos de Merge](10-merge-conflicts.md) quando duas pessoas editam o mesmo código.

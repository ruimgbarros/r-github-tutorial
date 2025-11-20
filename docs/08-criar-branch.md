# Criar e Usar Branches

Agora que perceb es o conceito de branches, vamos praticar a criar e trabalhar com elas no Positron e GitHub.

## 🎯 Objetivos

- Criar branches no Positron
- Criar branches diretamente no GitHub
- Trabalhar num workflow completo com branches
- Integrar branches com análise de dados em R

---

## 💻 Criar Branches no Positron

### Interface Visual do Positron

**Passo 1: Abrir o Painel Git**
- View → Git (se não estiver visível)
- Ou usa o ícone de Git na barra lateral

**Passo 2: Criar Nova Branch**
1. Clica no nome da branch atual (ex: "main") no topo do painel Git
2. Aparece dropdown com opções
3. Seleciona "New Branch..."
4. Introduz o nome: `feature-analise-regional`
5. Confirma se queres fazer checkout imediato: ✅
6. Clica OK

✅ Agora estás na nova branch! Vês o nome mudar no painel Git.

### Verificar Branch Ativa

No Positron, vês a branch ativa em **3 locais**:
1. **Painel Git**: Nome no topo
2. **Status bar** (barra inferior): Mostra `main` ou `feature-...`
3. **Terminal integrado**: Prompt mostra branch (se configurado)

---

## 🌐 Criar Branches no GitHub Web

Por vezes é útil criar branches diretamente no GitHub.

### Método 1: Dropdown de Branches

1. **Vai ao repositório** no GitHub
2. **Clica no dropdown** de branches (esquerda, mostra "main")
3. **Escreve o nome** da nova branch: `feature-dashboard`
4. **Clica "Create branch: feature-dashboard from main"**

✅ Branch criada no remoto!

**Para trabalhar nela localmente**:
```bash
# Obter info das branches remotas
git fetch

# Fazer checkout da branch
git checkout feature-dashboard

# Ou tudo num comando
git checkout -b feature-dashboard origin/feature-dashboard
```

### Método 2: A Partir de um Ficheiro

1. **Navega até um ficheiro** no GitHub
2. **Clica em editar** (ícone lápis)
3. **Faz alterações**
4. **Em baixo**, onde diz "Commit changes":
   - Seleciona "Create a new branch for this commit"
   - Nome: `docs-update-readme`
5. **Clica "Propose changes"**

✅ Branch criada E commit feito!

---

## 🎯 Exercício Completo: Análise por Produto

Vamos fazer um exercício realista usando branches.

### Cenário

A equipa do DataH precisa de análises separadas por produto. Cada pessoa vai trabalhar num produto diferente, usando branches.

### Parte 1: Criar Branch

**No Positron**:
```bash
# 1. Garantir que main está atualizada
git checkout main
git pull

# 2. Criar branch para análise de Laptops
git checkout -b analise-laptops
```

### Parte 2: Implementar Análise

**Editar `scripts/03-analise.R`**, adicionar no final:

```r
# ============================================================================
# Análise: Laptops
# ============================================================================

analise_laptops <- vendas %>%
  filter(produto == "Laptop") %>%
  group_by(mes, regiao) %>%
  summarise(
    quantidade = sum(quantidade),
    receita = sum(valor_total),
    ticket_medio = mean(valor_total),
    .groups = "drop"
  )

print("=== Análise de Laptops ===")
print(analise_laptops)

# Vendas totais de laptops
total_laptops <- sum(analise_laptops$receita)
print(paste("Receita total de Laptops: €", format(total_laptops, big.mark = " ")))

# Região com mais vendas de laptops
top_regiao_laptop <- analise_laptops %>%
  group_by(regiao) %>%
  summarise(total = sum(receita)) %>%
  arrange(desc(total)) %>%
  slice(1)

print(paste("Top região para Laptops:", top_regiao_laptop$regiao))
```

### Parte 3: Testar o Código

**No console do Positron**:
```r
# Carregar os dados primeiro
source("scripts/01-importar-dados.R")

# Testar a análise
source("scripts/03-analise.R")
```

✅ Verifica que funciona sem erros!

### Parte 4: Commit e Push

**No Positron (interface visual)**:
1. Painel Git → vês `scripts/03-analise.R` modificado
2. Stage o ficheiro (checkbox ou botão +)
3. Escrever mensagem de commit:
   ```
   Adicionar análise detalhada de vendas de Laptops

   - Análise por mês e região
   - Cálculo de receita total
   - Identificação da região top
   ```
4. Clica "Commit"
5. Clica "Push" (seta para cima ↑)

**Ou no terminal**:
```bash
git add scripts/03-analise.R
git commit -m "Adicionar análise detalhada de vendas de Laptops"
git push -u origin analise-laptops
```

---

## 👥 Trabalho Paralelo em Branches

### Cenário: 3 Pessoas, 3 Produtos

**Pessoa A** (tu):
```bash
git checkout -b analise-laptops
# Trabalha em Laptops
git push -u origin analise-laptops
```

**Pessoa B** (colega):
```bash
git checkout -b analise-monitores
# Trabalha em Monitores
git push -u origin analise-monitores
```

**Pessoa C** (colega):
```bash
git checkout -b analise-teclados
# Trabalha em Teclados
git push -u origin analise-teclados
```

**Resultado**: Todos trabalham **em paralelo sem conflitos**!

```
main:            A
                 |\
                 | \_____ analise-laptops (Pessoa A)
                 |
                 |\_____ analise-monitores (Pessoa B)
                 |
                 \______ analise-teclados (Pessoa C)
```

---

## 🔄 Atualizar Branch com Main

À medida que trabalhas na tua branch, a `main` pode receber novos commits. É importante manter a tua branch atualizada.

### Quando Atualizar?

- Ao fim de cada dia
- Antes de abrir Pull Request
- Quando há alterações importantes na main
- Se tiveres conflitos ao fazer merge

### Como Atualizar (Merge)

```bash
# Na tua feature branch
git checkout analise-laptops

# Obter alterações da main
git checkout main
git pull
git checkout analise-laptops

# Fazer merge da main para a tua branch
git merge main

# Se houver conflitos, resolver e:
git add .
git commit -m "Merge main into analise-laptops"

# Push
git push
```

### Como Atualizar (Rebase) - Alternativa

**Rebase** reescreve o histórico para ficar mais limpo:

```bash
# Na tua feature branch
git checkout analise-laptops

# Rebase sobre a main atualizada
git fetch origin
git rebase origin/main

# Se houver conflitos:
# 1. Resolver conflitos
# 2. git add ficheiros-resolvidos
# 3. git rebase --continue

# Push (pode precisar de force se já fizeste push antes)
git push --force-with-lease
```

**⚠️ Cuidado**: Só usa rebase se:
- Ninguém mais está a trabalhar na tua branch
- Percebes bem o que faz
- A branch ainda não foi feita merge para main

**Regra geral para iniciantes**: Usa `merge`, não `rebase`.

---

## 🔍 Ver Estado das Branches

### Localmente

```bash
# Ver todas as branches
git branch -a

# Ver com último commit
git branch -v

# Ver branches merged vs não-merged
git branch --merged      # Já foram merged para a branch atual
git branch --no-merged   # Ainda não foram merged
```

### No GitHub

**Ver todas as branches**:
1. Vai ao repositório
2. Clica em "branches" (ao lado de "commits")
3. Vês lista de todas as branches:
   - Active branches
   - Stale branches (sem atividade)
   - Ahead/behind main

**Comparar branches**:
1. Vai a uma branch
2. Clica "Compare"
3. Vês diferenças entre a branch e main

---

## 🎨 Visualização de Trabalho em Branches

### Exemplo Realista

```
Dia 1:
main:     A---B
               \
analise:        C (adicionar estrutura básica)

Dia 2:
main:     A---B---X (colega fez merge de outra feature)
               \
analise:        C---D (implementar cálculos)

Dia 3 (antes de PR):
main:     A---B---X---Y
               \     \
analise:        C---D--M (merge main para resolver conflitos)
                       \
                        E (finalizar)

Depois do PR aprovado:
main:     A---B---X---Y-------MERGE (análise integrada!)
               \             /
analise:        C---D--M---E
```

---

## 🎯 Exercício: Branch para Visualização

Agora cria uma branch para adicionar visualizações.

### Passo a Passo

**1. Criar branch**:
```bash
git checkout main
git pull
git checkout -b feature-grafico-regional
```

**2. Editar `scripts/04-visualizacao.R`**, completar um dos gráficos:

```r
# Gráfico de vendas por região
library(ggplot2)
library(scales)

vendas_regiao <- vendas %>%
  group_by(regiao) %>%
  summarise(total = sum(valor_total))

grafico_regiao <- ggplot(vendas_regiao,
                         aes(x = reorder(regiao, total),
                             y = total,
                             fill = regiao)) +
  geom_col() +
  coord_flip() +
  scale_y_continuous(labels = label_currency(prefix = "€")) +
  labs(
    title = "Vendas Totais por Região",
    subtitle = "Primeiro trimestre 2024",
    x = "Região",
    y = "Valor Total"
  ) +
  theme_minimal() +
  theme(legend.position = "none")

print(grafico_regiao)
```

**3. Testar**:
```r
source("scripts/01-importar-dados.R")
source("scripts/04-visualizacao.R")
```

**4. Commit e push**:
```bash
git add scripts/04-visualizacao.R
git commit -m "Adicionar gráfico de vendas por região"
git push -u origin feature-grafico-regional
```

**5. Verificar no GitHub**:
- Vai ao repositório
- Vês banner: "feature-grafico-regional had recent pushes"
- Clica "Compare & pull request" (vamos fazer isto no próximo módulo!)

---

## ✅ Checklist

Antes de avançar, confirma que consegues:

- [ ] Criar branch no Positron (interface visual)
- [ ] Criar branch no terminal
- [ ] Criar branch no GitHub web
- [ ] Ver que branch está ativa
- [ ] Mudar entre branches
- [ ] Fazer commit numa branch
- [ ] Push de branch para GitHub
- [ ] Ver lista de branches (local e remoto)
- [ ] Atualizar branch com main (merge)
- [ ] Trabalhar em várias branches em paralelo

---

## 🎉 Próximo Passo

Ótimo! Agora que sabes trabalhar com branches, vamos aprender a juntar o teu trabalho com a branch principal através de [Pull Requests](09-pull-requests.md)!

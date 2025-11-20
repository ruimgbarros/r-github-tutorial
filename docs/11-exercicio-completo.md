# Exercício Completo End-to-End

Este exercício integra tudo o que aprendeste: branches, commits, PRs, resolução de conflitos e trabalho colaborativo com R e Quarto.

## 🎯 Objetivo do Projeto

Criar um relatório completo de análise de vendas, trabalhando em equipa usando Git e GitHub.

**Resultado final**: Relatório Quarto publicável com:
- Análise de dados limpos
- Visualizações profissionais
- Insights e recomendações

---

## 👥 Organização da Equipa

Este exercício funciona melhor com **2-4 pessoas**, mas podes fazer sozinho simulando múltiplas branches.

### Divisão de Tarefas

**Pessoa 1**: Limpeza e preparação de dados
**Pessoa 2**: Análise agregada (por região, produto, vendedor)
**Pessoa 3**: Visualizações (gráficos ggplot2)
**Pessoa 4**: Relatório Quarto (integrar tudo)

Se fores **sozinho**: Faz cada tarefa numa branch separada.

---

## 📋 Setup Inicial

### Líder do Projeto (Pessoa 1)

**1. Já tens o repositório** (este tutorial).

**2. Adicionar colaboradores** (se trabalhares em grupo):
- GitHub → Settings → Collaborators
- Adicionar colegas por username/email

### Todos os Membros

**1. Clone o repositório**:
```bash
git clone https://github.com/[USERNAME]/r-github-tutorial.git
cd r-github-tutorial
```

**2. Abrir no Positron**:
- File → Open Project
- Selecionar `tutorial.Rproj`

**3. Instalar dependências**:
```r
install.packages(c("tidyverse", "scales", "knitr", "quarto"))
```

**4. Testar setup**:
```r
source("scripts/01-importar-dados.R")
```

✅ Se funcionar, estão prontos!

---

## 🏃 Fase 1: Preparação de Dados

**Responsável**: Pessoa 1 (ou primeira branch se estás sozinho)

### 1.1 Criar Branch

```bash
git checkout main
git pull
git checkout -b feature-preparacao-dados
```

### 1.2 Completar Script de Limpeza

Editar `scripts/02-limpeza-dados.R`:

```r
# ============================================================================
# Script 2: Limpeza e Transformação de Dados
# ============================================================================

library(tidyverse)
library(lubridate)

# Importar dados
vendas <- read_csv("data/vendas_mensais.csv", show_col_types = FALSE)

# ----------------------------------------------------------------------------
# Transformações
# ----------------------------------------------------------------------------

vendas_limpo <- vendas %>%
  # Converter mês para data
  mutate(mes = ymd(paste0(mes, "-01"))) %>%

  # Calcular valor total
  mutate(valor_total = quantidade * valor_unitario) %>%

  # Adicionar trimestre
  mutate(
    trimestre = case_when(
      month(mes) %in% 1:3 ~ "Q1",
      month(mes) %in% 4:6 ~ "Q2",
      month(mes) %in% 7:9 ~ "Q3",
      month(mes) %in% 10:12 ~ "Q4"
    )
  ) %>%

  # Converter para factors
  mutate(across(c(produto, regiao, vendedor), as.factor))

# Verificação
print("=== Estrutura dos dados limpos ===")
glimpse(vendas_limpo)

print("\n=== Primeiras linhas ===")
print(head(vendas_limpo))

# Guardar dados limpos
write_csv(vendas_limpo, "data/vendas_limpas.csv")

print("\n✅ Dados limpos guardados em data/vendas_limpas.csv")
```

### 1.3 Testar

```r
source("scripts/02-limpeza-dados.R")
```

### 1.4 Commit e Push

```bash
git add scripts/02-limpeza-dados.R
git add data/vendas_limpas.csv
git add data/.gitkeep  # Se necessário

git commit -m "Completar script de limpeza de dados

- Converter mês para formato de data
- Calcular valor_total
- Adicionar coluna trimestre
- Converter variáveis categóricas para factors
- Guardar dados limpos"

git push -u origin feature-preparacao-dados
```

### 1.5 Abrir Pull Request

1. GitHub → "Compare & pull request"
2. Título: `Completar preparação e limpeza de dados`
3. Descrição:
   ```markdown
   ## Alterações
   - Script de limpeza completo e funcional
   - Dados limpos guardados em CSV
   - Todas as transformações testadas

   ## Como testar
   ```r
   source("scripts/02-limpeza-dados.R")
   ```

   ## Ficheiros
   - `scripts/02-limpeza-dados.R` ✅
   - `data/vendas_limpas.csv` ✅
   ```
4. Create PR
5. **NÃO fazer merge ainda** - esperar por revisão

---

## 📊 Fase 2: Análise de Dados

**Responsável**: Pessoa 2

### 2.1 Criar Branch

```bash
git checkout main
git pull
git checkout -b feature-analise-agregada
```

### 2.2 Completar Script de Análise

Editar `scripts/03-analise.R`:

```r
# ============================================================================
# Script 3: Análise e Agregação de Dados
# ============================================================================

library(tidyverse)

# Importar dados limpos
vendas <- read_csv("data/vendas_limpas.csv", show_col_types = FALSE)

# ----------------------------------------------------------------------------
# Análise 1: Vendas por Região
# ----------------------------------------------------------------------------

vendas_por_regiao <- vendas %>%
  group_by(regiao) %>%
  summarise(
    total_vendas = sum(valor_total),
    quantidade_total = sum(quantidade),
    num_transacoes = n(),
    valor_medio = mean(valor_total)
  ) %>%
  arrange(desc(total_vendas))

print("=== Vendas por Região ===")
print(vendas_por_regiao)

# ----------------------------------------------------------------------------
# Análise 2: Vendas por Produto
# ----------------------------------------------------------------------------

vendas_por_produto <- vendas %>%
  group_by(produto) %>%
  summarise(
    total_vendas = sum(valor_total),
    quantidade_vendida = sum(quantidade),
    ticket_medio = mean(valor_total)
  ) %>%
  arrange(desc(total_vendas))

print("\n=== Vendas por Produto ===")
print(vendas_por_produto)

# ----------------------------------------------------------------------------
# Análise 3: Performance por Vendedor
# ----------------------------------------------------------------------------

performance_vendedor <- vendas %>%
  group_by(vendedor, regiao) %>%
  summarise(
    total_vendido = sum(valor_total),
    num_transacoes = n(),
    ticket_medio = mean(valor_total),
    .groups = "drop"
  ) %>%
  arrange(desc(total_vendido))

print("\n=== Performance dos Vendedores ===")
print(performance_vendedor)

# ----------------------------------------------------------------------------
# Análise 4: Evolução Temporal
# ----------------------------------------------------------------------------

evolucao_mensal <- vendas %>%
  group_by(mes) %>%
  summarise(valor_total_mes = sum(valor_total)) %>%
  arrange(mes) %>%
  mutate(
    crescimento = valor_total_mes - lag(valor_total_mes),
    crescimento_pct = (crescimento / lag(valor_total_mes)) * 100
  )

print("\n=== Evolução Mensal ===")
print(evolucao_mensal)

# Guardar análises para usar no relatório
save(vendas_por_regiao, vendas_por_produto, performance_vendedor,
     evolucao_mensal, file = "data/analises.RData")

print("\n✅ Análises guardadas em data/analises.RData")
```

### 2.3 Commit, Push e PR

```bash
git add scripts/03-analise.R
git add data/analises.RData
git commit -m "Implementar análises agregadas completas"
git push -u origin feature-analise-agregada
```

Criar PR no GitHub.

---

## 📈 Fase 3: Visualizações

**Responsável**: Pessoa 3

### 3.1 Criar Branch

```bash
git checkout main
git pull

# Fazer merge das PRs anteriores primeiro!
# (ou aguardar que estejam merged)

git checkout -b feature-visualizacoes
```

### 3.2 Completar Script de Visualização

Editar `scripts/04-visualizacao.R`:

```r
# ============================================================================
# Script 4: Visualização de Dados
# ============================================================================

library(tidyverse)
library(scales)

# Importar dados
vendas <- read_csv("data/vendas_limpas.csv", show_col_types = FALSE)

# ----------------------------------------------------------------------------
# Gráfico 1: Vendas por Região
# ----------------------------------------------------------------------------

grafico_vendas_regiao <- vendas %>%
  group_by(regiao) %>%
  summarise(total = sum(valor_total)) %>%
  ggplot(aes(x = reorder(regiao, total), y = total, fill = regiao)) +
  geom_col(show.legend = FALSE) +
  coord_flip() +
  scale_y_continuous(labels = label_currency(prefix = "€", big.mark = " ")) +
  labs(
    title = "Vendas Totais por Região",
    subtitle = "Primeiro trimestre 2024",
    x = NULL,
    y = "Valor Total"
  ) +
  theme_minimal(base_size = 13) +
  scale_fill_brewer(palette = "Set2")

print(grafico_vendas_regiao)

# ----------------------------------------------------------------------------
# Gráfico 2: Evolução Mensal por Produto
# ----------------------------------------------------------------------------

grafico_evolucao <- vendas %>%
  group_by(mes, produto) %>%
  summarise(total = sum(valor_total), .groups = "drop") %>%
  ggplot(aes(x = mes, y = total, color = produto, group = produto)) +
  geom_line(size = 1.2) +
  geom_point(size = 3) +
  scale_y_continuous(labels = label_currency(prefix = "€", big.mark = " ")) +
  scale_x_date(date_labels = "%b", date_breaks = "1 month") +
  labs(
    title = "Evolução Mensal de Vendas por Produto",
    x = "Mês",
    y = "Valor Total",
    color = "Produto"
  ) +
  theme_minimal(base_size = 13) +
  scale_color_brewer(palette = "Dark2")

print(grafico_evolucao)

# ----------------------------------------------------------------------------
# Gráfico 3: Performance dos Vendedores
# ----------------------------------------------------------------------------

grafico_vendedores <- vendas %>%
  group_by(vendedor) %>%
  summarise(total = sum(valor_total)) %>%
  ggplot(aes(x = reorder(vendedor, total), y = total)) +
  geom_segment(aes(xend = vendedor, y = 0, yend = total),
               size = 1.5, color = "steelblue") +
  geom_point(size = 5, color = "steelblue") +
  coord_flip() +
  scale_y_continuous(labels = label_currency(prefix = "€", big.mark = " ")) +
  labs(
    title = "Performance dos Vendedores",
    subtitle = "Total vendido no período",
    x = NULL,
    y = "Total Vendido"
  ) +
  theme_minimal(base_size = 13)

print(grafico_vendedores)

print("\n✅ Visualizações criadas com sucesso")
```

### 3.3 Commit, Push e PR

```bash
git add scripts/04-visualizacao.R
git commit -m "Adicionar visualizações profissionais com ggplot2"
git push -u origin feature-visualizacoes
```

Criar PR.

---

## 📄 Fase 4: Relatório Quarto

**Responsável**: Pessoa 4

### 4.1 Aguardar Merges

**IMPORTANTE**: Antes de começar, fazer merge de TODAS as PRs anteriores para a main!

### 4.2 Criar Branch

```bash
git checkout main
git pull  # Obter todos os merges
git checkout -b feature-relatorio-final
```

### 4.3 Completar Relatório

Editar `relatorios/relatorio-analise.qmd`:

```markdown
---
title: "Análise de Vendas - Q1 2024"
author: "Equipa DataH"
date: today
format:
  html:
    toc: true
    toc-depth: 2
    code-fold: true
    theme: cosmo
    embed-resources: true
execute:
  echo: false
  warning: false
  message: false
---

# Sumário Executivo

Este relatório apresenta a análise detalhada de vendas do primeiro trimestre de 2024,
cobrindo três linhas de produto (Laptop, Monitor, Teclado) em três regiões (Norte, Centro, Sul).

**Principais conclusões**:

- Vendas totais: €XXX.XXX
- Região com melhor performance: XXX
- Produto mais vendido: XXX
- Crescimento médio mensal: XX%

# Metodologia

```{r setup}
library(tidyverse)
library(scales)
library(knitr)

# Carregar dados limpos
vendas <- read_csv("../data/vendas_limpas.csv", show_col_types = FALSE)

# Carregar análises
load("../data/analises.RData")
```

# Análise por Região

## Distribuição de Vendas

```{r analise-regiao}
#| fig-cap: "Distribuição de vendas totais por região"
#| fig-width: 8
#| fig-height: 5

vendas %>%
  group_by(regiao) %>%
  summarise(total = sum(valor_total)) %>%
  ggplot(aes(x = reorder(regiao, total), y = total, fill = regiao)) +
  geom_col(show.legend = FALSE) +
  coord_flip() +
  scale_y_continuous(labels = label_currency(prefix = "€", big.mark = " ")) +
  labs(title = "Vendas Totais por Região", x = NULL, y = "Valor Total") +
  theme_minimal() +
  scale_fill_brewer(palette = "Set2")
```

## Estatísticas Regionais

```{r tabela-regiao}
#| tbl-cap: "Métricas de vendas por região"

vendas_por_regiao %>%
  mutate(across(where(is.numeric), ~format(round(., 2), big.mark = " "))) %>%
  kable(col.names = c("Região", "Total Vendas (€)", "Quantidade",
                      "Nº Transações", "Valor Médio (€)"))
```

**Insights**:

- A região Sul lidera com XX% do total de vendas
- Região Norte tem o ticket médio mais elevado
- Centro apresenta o maior número de transações

# Análise por Produto

## Evolução Temporal

```{r evolucao-produto}
#| fig-cap: "Evolução mensal de vendas por produto"
#| fig-width: 10
#| fig-height: 6

vendas %>%
  group_by(mes, produto) %>%
  summarise(total = sum(valor_total), .groups = "drop") %>%
  ggplot(aes(x = mes, y = total, color = produto, group = produto)) +
  geom_line(size = 1.2) +
  geom_point(size = 3) +
  scale_y_continuous(labels = label_currency(prefix = "€", big.mark = " ")) +
  scale_x_date(date_labels = "%b", date_breaks = "1 month") +
  labs(title = "Evolução Mensal por Produto", x = "Mês",
       y = "Valor Total", color = "Produto") +
  theme_minimal() +
  scale_color_brewer(palette = "Dark2")
```

## Performance por Produto

```{r tabela-produto}
vendas_por_produto %>%
  mutate(across(where(is.numeric), ~format(round(., 2), big.mark = " "))) %>%
  kable(col.names = c("Produto", "Total Vendas (€)",
                      "Quantidade", "Ticket Médio (€)"))
```

# Análise de Vendedores

```{r performance-vendedores}
#| fig-cap: "Performance individual dos vendedores"
#| fig-width: 8
#| fig-height: 5

vendas %>%
  group_by(vendedor) %>%
  summarise(total = sum(valor_total)) %>%
  ggplot(aes(x = reorder(vendedor, total), y = total)) +
  geom_segment(aes(xend = vendedor, y = 0, yend = total),
               size = 1.5, color = "steelblue") +
  geom_point(size = 5, color = "steelblue") +
  coord_flip() +
  scale_y_continuous(labels = label_currency(prefix = "€", big.mark = " ")) +
  labs(title = "Total Vendido por Vendedor", x = NULL, y = "Total Vendido") +
  theme_minimal()
```

# Conclusões e Recomendações

## Principais Insights

1. **Crescimento consistente**: Vendas cresceram em média X% ao mês
2. **Região Sul domina**: Representa XX% do total de vendas
3. **Laptops lideram**: Produto com maior receita total

## Recomendações

1. **Investir em marketing na região Norte** para equilibrar performance
2. **Expandir stock de Laptops** dada a procura crescente
3. **Formação adicional** para vendedor com performance inferior

## Próximos Passos

- [ ] Análise de dados do Q2 2024
- [ ] Estudo de sazonalidade
- [ ] Comparação year-over-year

---

*Relatório gerado automaticamente com R e Quarto*
```

### 4.4 Renderizar Relatório

```r
# No console do Positron
quarto::quarto_render("relatorios/relatorio-analise.qmd")
```

Abre o HTML gerado!

### 4.5 Commit, Push e PR

```bash
git add relatorios/relatorio-analise.qmd
git add relatorios/relatorio-analise.html

git commit -m "Completar relatório final de análise Q1 2024

- Integrar todas as análises e visualizações
- Adicionar insights e recomendações
- Relatório renderizado em HTML"

git push -u origin feature-relatorio-final
```

Criar PR final.

---

## 🔄 Fase 5: Revisões e Merges

### 5.1 Rever Pull Requests

Cada pessoa **revê** pelo menos um PR de outra pessoa:

**Checklist de revisão**:
- [ ] Código funciona (testar localmente)
- [ ] Sem erros ou warnings
- [ ] Comentários claros
- [ ] Segue convenções do projeto
- [ ] Mensagens de commit descritivas

**Dar feedback** construtivo:
- Fazer comentários em linhas específicas
- Sugerir melhorias
- Aprovar quando estiver bom

### 5.2 Ordem de Merge

**Importante**: Fazer merge pela ordem das dependências!

```
1. feature-preparacao-dados (cria vendas_limpas.csv)
   ↓
2. feature-analise-agregada (usa vendas_limpas.csv)
   ↓
3. feature-visualizacoes (usa vendas_limpas.csv)
   ↓
4. feature-relatorio-final (usa tudo)
```

### 5.3 Fazer Merges

Para cada PR:
1. **Resolver comentários** se houver
2. **Atualizar branch** com main se necessário:
   ```bash
   git checkout feature-preparacao-dados
   git merge main
   git push
   ```
3. **Merge PR** no GitHub
4. **Delete branch** após merge

---

## 🎉 Fase 6: Celebrar!

### 6.1 Verificar Resultado Final

```bash
git checkout main
git pull
```

**Verificar que tens tudo**:
- Scripts completos (01, 02, 03, 04)
- Dados limpos e análises
- Relatório final renderizado

### 6.2 Executar Workflow Completo

```r
# Pipeline completo
source("scripts/01-importar-dados.R")
source("scripts/02-limpeza-dados.R")
source("scripts/03-analise.R")
source("scripts/04-visualizacao.R")

# Renderizar relatório
quarto::quarto_render("relatorios/relatorio-analise.qmd")
```

✅ **Tudo funciona!**

### 6.3 GitHub Pages (Opcional)

Publicar o relatório online:

1. Settings → Pages
2. Source: Deploy from a branch
3. Branch: main
4. Folder: `/relatorios`
5. Save

URL: `https://[username].github.io/r-github-tutorial/relatorio-analise.html`

---

## 📚 O Que Aprendeste

Neste exercício completo, praticaste:

✅ **Git/GitHub**:
- Criar e gerir branches
- Fazer commits descritivos
- Push e pull
- Pull Requests
- Code review
- Merge strategies
- Resolver conflitos (se aconteceram!)

✅ **Trabalho Colaborativo**:
- Divisão de tarefas
- Comunicação via GitHub
- Feedback construtivo
- Integração de trabalho de múltiplas pessoas

✅ **R e Análise de Dados**:
- Limpeza de dados com tidyverse
- Análises agregadas
- Visualizações com ggplot2
- Relatórios com Quarto

✅ **Boas Práticas**:
- Código modular
- Testes antes de commit
- Documentação clara
- Workflow reproduzível

---

## 🎯 Desafio Extra

Agora que completaste o exercício base, tenta adicionar:

**1. Análise adicional**:
- Branch: `feature-analise-sazonal`
- Investigar padrões sazonais
- PR com a nova análise

**2. Novo gráfico**:
- Branch: `feature-grafico-heatmap`
- Heatmap de vendas por região e produto
- Integrar no relatório

**3. Testes automatizados**:
- Branch: `feature-add-tests`
- Adicionar testes com testthat
- Validar dados e funções

**4. GitHub Actions**:
- Configurar CI/CD
- Renderizar relatório automaticamente em cada push

---

## ✅ Checklist Final

Confirma que completaste:

- [ ] Todas as 4 branches criadas
- [ ] Todos os scripts funcionam
- [ ] 4 Pull Requests criados
- [ ] PRs revisados e merged
- [ ] Branches limpas (deletadas após merge)
- [ ] Relatório final renderizado
- [ ] Pipeline completo funciona end-to-end
- [ ] Aprendeste a trabalhar colaborativamente com Git!

---

**Parabéns! 🎉** Completaste o exercício integrado e estás pronto para usar Git e GitHub em projetos reais no DataH!

# ============================================================================
# Script 3: Análise e Agregação de Dados
# ============================================================================
# Objetivo: Calcular métricas agregadas e fazer análises por grupo
# Autor: [O TEU NOME AQUI]
# Data: [DATA]
# ============================================================================

# Carregar pacotes necessários
library(tidyverse)

# Importar dados
vendas <- read_csv("data/vendas_mensais.csv")

# Preparação básica (assumindo que já limpaste os dados)
vendas <- vendas %>%
  mutate(
    mes = as.Date(paste0(mes, "-01")),
    valor_total = quantidade * valor_unitario
  )

# ----------------------------------------------------------------------------
# EXERCÍCIO: Análises Agregadas
# ----------------------------------------------------------------------------

# TODO 1: Total de vendas por região
# vendas_por_regiao <- vendas %>%
#   group_by(...) %>%
#   summarise(
#     total_vendas = ...,
#     quantidade_total = ...,
#     valor_medio = ...
#   )

# TODO 2: Vendas mensais por produto
# vendas_mensais_produto <- vendas %>%
#   group_by(..., ...) %>%
#   summarise(...)

# TODO 3: Performance por vendedor
# performance_vendedor <- vendas %>%
#   group_by(...) %>%
#   summarise(
#     total_vendido = ...,
#     numero_transacoes = ...,
#     ticket_medio = ...
#   ) %>%
#   arrange(desc(total_vendido))

# TODO 4: Análise de crescimento mensal
# crescimento_mensal <- vendas %>%
#   group_by(mes) %>%
#   summarise(valor_total_mes = sum(valor_total)) %>%
#   mutate(
#     crescimento = ...,  # Dica: usa lag() para comparar com mês anterior
#     crescimento_pct = ...
#   )

# ----------------------------------------------------------------------------
# Visualizar resultados
# ----------------------------------------------------------------------------

# Descomentar após completares as análises:
# print("=== Vendas por Região ===")
# print(vendas_por_regiao)

# print("\n=== Top 5 Produtos Mais Vendidos ===")
# print(head(vendas_mensais_produto, 5))

# print("\n=== Performance dos Vendedores ===")
# print(performance_vendedor)

# ----------------------------------------------------------------------------
# Pivot tables (transformar dados de long para wide)
# ----------------------------------------------------------------------------

# TODO 5: Criar pivot table - produtos em linhas, regiões em colunas
# vendas_pivot <- vendas %>%
#   group_by(produto, regiao) %>%
#   summarise(total = sum(valor_total), .groups = "drop") %>%
#   pivot_wider(
#     names_from = ...,
#     values_from = ...
#   )

# Nota: Este script será completado como parte dos exercícios de branching!

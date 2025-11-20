# ============================================================================
# Script 1: Importar e Explorar Dados
# ============================================================================
# Objetivo: Carregar os dados de vendas e fazer uma exploração inicial
# Autor: Tutorial Git & GitHub
# Data: 2024
# ============================================================================

# Carregar pacotes necessários
library(tidyverse)

# Importar dados
vendas <- read_csv("data/vendas_mensais.csv")

# Exploração inicial
print("=== Primeiras linhas dos dados ===")
print(head(vendas))

print("\n=== Estrutura dos dados ===")
print(glimpse(vendas))

print("\n=== Resumo estatístico ===")
print(summary(vendas))

print("\n=== Valores únicos por coluna ===")
print("Produtos:")
print(unique(vendas$produto))

print("\nRegiões:")
print(unique(vendas$regiao))

print("\nVendedores:")
print(unique(vendas$vendedor))

# Verificar valores em falta
print("\n=== Valores em falta ===")
print(colSums(is.na(vendas)))

# Nota: Este é o primeiro script base.
# Nos próximos exercícios, vais criar branches para adicionar mais análises!

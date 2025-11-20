# ============================================================================
# Script 2: Limpeza e Transformação de Dados
# ============================================================================
# Objetivo: Limpar e preparar os dados para análise
# Autor: [O TEU NOME AQUI]
# Data: [DATA]
# ============================================================================

# Carregar pacotes necessários
library(tidyverse)

# Importar dados
vendas <- read_csv("data/vendas_mensais.csv")

# ----------------------------------------------------------------------------
# EXERCÍCIO: Completa as transformações abaixo
# ----------------------------------------------------------------------------

# TODO: Converter a coluna 'mes' para formato de data
# Dica: usa a função as.Date() ou lubridate::ymd()
# vendas <- vendas %>%
#   mutate(mes = ...)

# TODO: Criar uma coluna 'valor_total' (quantidade * valor_unitario)
# vendas <- vendas %>%
#   mutate(valor_total = ...)

# TODO: Criar uma coluna 'trimestre' baseada no mês
# Dica: Q1 = Jan-Mar, Q2 = Abr-Jun, Q3 = Jul-Set, Q4 = Out-Dez
# vendas <- vendas %>%
#   mutate(trimestre = ...)

# TODO: Converter colunas de texto para factors (produto, regiao, vendedor)
# vendas <- vendas %>%
#   mutate(across(c(produto, regiao, vendedor), as.factor))

# ----------------------------------------------------------------------------
# Verificação dos dados limpos
# ----------------------------------------------------------------------------

# Descomentar após completares as transformações acima:
# print("=== Estrutura dos dados limpos ===")
# glimpse(vendas)

# print("\n=== Primeiras linhas com novas colunas ===")
# head(vendas)

# ----------------------------------------------------------------------------
# Guardar dados limpos (opcional)
# ----------------------------------------------------------------------------

# Descomentar se quiseres guardar os dados transformados:
# write_csv(vendas, "data/vendas_limpas.csv")

# Nota: Este script será completado num exercício de Git!
# Vais criar uma branch, fazer as alterações, e abrir um Pull Request.

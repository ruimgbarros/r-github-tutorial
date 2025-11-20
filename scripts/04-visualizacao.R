# ============================================================================
# Script 4: Visualização de Dados
# ============================================================================
# Objetivo: Criar gráficos com ggplot2 para explorar padrões nos dados
# Autor: [O TEU NOME AQUI]
# Data: [DATA]
# ============================================================================

# Carregar pacotes necessários
library(tidyverse)
library(scales)  # Para formatação de eixos

# Importar e preparar dados
vendas <- read_csv("data/vendas_mensais.csv") %>%
  mutate(
    mes = as.Date(paste0(mes, "-01")),
    valor_total = quantidade * valor_unitario
  )

# ----------------------------------------------------------------------------
# EXERCÍCIO 1: Vendas Totais por Região (Gráfico de Barras)
# ----------------------------------------------------------------------------

# TODO: Criar gráfico de barras mostrando total de vendas por região
# grafico_vendas_regiao <- vendas %>%
#   group_by(regiao) %>%
#   summarise(total = sum(valor_total)) %>%
#   ggplot(aes(x = reorder(regiao, total), y = total, fill = regiao)) +
#   geom_col() +
#   coord_flip() +  # Barras horizontais
#   scale_y_continuous(labels = label_currency(prefix = "€")) +
#   labs(
#     title = "Vendas Totais por Região",
#     x = "Região",
#     y = "Valor Total",
#     caption = "Dados de vendas Q1-Q2 2024"
#   ) +
#   theme_minimal() +
#   theme(legend.position = "none")

# Mostrar gráfico
# print(grafico_vendas_regiao)

# ----------------------------------------------------------------------------
# EXERCÍCIO 2: Evolução Temporal das Vendas (Linha)
# ----------------------------------------------------------------------------

# TODO: Gráfico de linha mostrando evolução mensal por produto
# grafico_evolucao <- vendas %>%
#   group_by(mes, produto) %>%
#   summarise(total = sum(valor_total), .groups = "drop") %>%
#   ggplot(aes(x = mes, y = total, color = produto, group = produto)) +
#   geom_line(size = 1.2) +
#   geom_point(size = 2) +
#   scale_y_continuous(labels = label_currency(prefix = "€")) +
#   scale_x_date(date_labels = "%b %Y", date_breaks = "1 month") +
#   labs(
#     title = "Evolução Mensal de Vendas por Produto",
#     x = "Mês",
#     y = "Valor Total",
#     color = "Produto"
#   ) +
#   theme_minimal() +
#   theme(axis.text.x = element_text(angle = 45, hjust = 1))

# print(grafico_evolucao)

# ----------------------------------------------------------------------------
# EXERCÍCIO 3: Comparação Multi-Dimensional (Facets)
# ----------------------------------------------------------------------------

# TODO: Gráfico facetado - vendas por produto em cada região
# grafico_facetado <- vendas %>%
#   group_by(mes, produto, regiao) %>%
#   summarise(total = sum(valor_total), .groups = "drop") %>%
#   ggplot(aes(x = mes, y = total, fill = produto)) +
#   geom_col(position = "dodge") +
#   facet_wrap(~ regiao, ncol = 1) +
#   scale_y_continuous(labels = label_currency(prefix = "€")) +
#   scale_x_date(date_labels = "%b", date_breaks = "1 month") +
#   labs(
#     title = "Vendas por Produto e Região",
#     x = "Mês",
#     y = "Valor Total",
#     fill = "Produto"
#   ) +
#   theme_minimal() +
#   theme(axis.text.x = element_text(angle = 45, hjust = 1))

# print(grafico_facetado)

# ----------------------------------------------------------------------------
# EXERCÍCIO 4: Performance dos Vendedores (Lollipop Chart)
# ----------------------------------------------------------------------------

# TODO: Criar lollipop chart para performance de vendedores
# grafico_vendedores <- vendas %>%
#   group_by(vendedor) %>%
#   summarise(total = sum(valor_total)) %>%
#   ggplot(aes(x = reorder(vendedor, total), y = total)) +
#   geom_segment(aes(xend = vendedor, y = 0, yend = total), size = 1) +
#   geom_point(size = 4, color = "steelblue") +
#   coord_flip() +
#   scale_y_continuous(labels = label_currency(prefix = "€")) +
#   labs(
#     title = "Performance dos Vendedores",
#     x = "Vendedor",
#     y = "Total Vendido"
#   ) +
#   theme_minimal()

# print(grafico_vendedores)

# ----------------------------------------------------------------------------
# Guardar gráficos (opcional)
# ----------------------------------------------------------------------------

# Descomentar para guardar os gráficos como ficheiros:
# ggsave("outputs/vendas_regiao.png", grafico_vendas_regiao, width = 10, height = 6)
# ggsave("outputs/evolucao_vendas.png", grafico_evolucao, width = 12, height = 6)

# Nota: Estes gráficos serão usados no relatório Quarto!

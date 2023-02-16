library(tidyverse)
library(xlsx)
library(readxl)
library(lubridate)
library(forcats)
library(ggpubr)

if (!is.null(getwd())) setwd("D:/Users/Eduardo/Documents/BI/PB");

# Recebendo as tabelas criadas nas outras etapas
view1 <- read.xlsx("D:/Users/Eduardo/Documents/BI/PB/Casos_Contaminação_Anual.xlsx", sheetName = "Sheet1")
view2 <- read.xlsx("D:/Users/Eduardo/Documents/BI/PB/Casos_Obito_Anual.xlsx", sheetName = "Sheet1")
view_2020 <- read.xlsx("D:/Users/Eduardo/Documents/BI/PB/2020_Mensal.xlsx", sheetName = "Sheet1")
view_2021 <- read.xlsx("D:/Users/Eduardo/Documents/BI/PB/2021_Mensal.xlsx", sheetName = "Sheet1")
view_2022 <- read.xlsx("D:/Users/Eduardo/Documents/BI/PB/2022_Mensal.xlsx", sheetName = "Sheet1")

# Criando as Vizualizações dos calculos anuais em gráfico de barras
ggplot(view1, aes(years, porcentagemCaso)) +
  geom_bar(stat = "identity", position = "dodge") +
  labs(title = "Porcentagens de Casos de Contaminação por ano")

ggplot(view2, aes(years, porcentagemObito)) +
  geom_bar(stat = "identity", position = "dodge") +
  labs(title = "Porcentagens de Casos de Obitos por ano")

# Vizualizando os gráficos de casos mensais, por ano
meses_ord <- c("Janeiro", "Fevereiro", "Março", "Abril", "Maio", "Junho", "Julho",
               "Agosto", "Setembro", "Outubro", "Novembro", "Dezembro")

# 2020
p1 <- view_2020 %>%
  mutate(Meses = fct_relevel(Mes, meses_ord)) %>%
  ggplot(aes(Meses)) +
  geom_bar(aes(y = Casos),
           stat = "identity",
           fill = "blue",
           width = .4,
           position = position_nudge(x = -.20)) +
  geom_bar(aes(y = Obitos),
           stat = "identity",
           fill = "red",
           width = .4,
           position = position_nudge(x = .20)) +
  labs(
  title = "2020",
  subtitle = "Casos de Contaminação (Azul) e Obito (Vermelho)",
  x = "Meses",
  y = "Total de Casos",
  fill = "Casos"
  )

p2 <- view_2020 %>%
  mutate(Meses = fct_relevel(Mes, meses_ord)) %>%
  ggplot(aes(Meses)) +
  geom_line(aes(y = Letalidade),
            color = "orange",
            group = 1) +
  labs(
    title = "2020",
    subtitle = "Porcentagem da Letalidade",
    x = "Meses",
    y = "Porcentagem (%)",
    fill = "Letalidade"
  )

ggarrange(p1, p2,
          labels = c("A", "B"),
          ncol = 1, nrow = 2)

# 2021
p3 <- view_2021 %>%
  mutate(Meses = fct_relevel(Mes, meses_ord)) %>%
  ggplot(aes(Meses)) +
  geom_bar(aes(y = Casos),
           stat = "identity",
           fill = "blue",
           width = .4,
           position = position_nudge(x = -.20)) +
  geom_bar(aes(y = Obitos),
           stat = "identity",
           fill = "red",
           width = .4,
           position = position_nudge(x = .20)) +
  labs(
    title = "2021",
    subtitle = "Casos de Contaminação (Azul) e Obito (Vermelho)",
    x = "Meses",
    y = "Total de Casos",
    fill = "Casos")

p4 <- view_2021 %>%
  mutate(Meses = fct_relevel(Mes, meses_ord)) %>%
  ggplot(aes(Meses)) +
  geom_line(aes(y = Letalidade),
            color = "orange",
            group = 1) +
  labs(
    title = "2020",
    subtitle = "Porcentagem da Letalidade",
    x = "Meses",
    y = "Porcentagem (%)",
    fill = "Letalidade")

ggarrange(p3, p4,
          labels = c("A", "B"),
          ncol = 1, nrow = 2)

# 2022
p5 <- view_2022 %>%
  mutate(Meses = fct_relevel(Mes, meses_ord)) %>%
  ggplot(aes(Meses)) +
  geom_bar(aes(y = Casos),
           stat = "identity",
           fill = "blue",
           width = .4,
           position = position_nudge(x = -.20)) +
  geom_bar(aes(y = Obitos),
           stat = "identity",
           fill = "red",
           width = .4,
           position = position_nudge(x = .20)) +
  labs(
    title = "2022",
    subtitle = "Casos de Contaminação (Azul) e Obito (Vermelho)",
    x = "Meses",
    y = "Total de Casos",
    fill = "Casos") +
  scale_y_continuous(trans = "log100")

p6 <- view_2022 %>%
  mutate(Meses = fct_relevel(Mes, meses_ord)) %>%
  ggplot(aes(Meses)) +
  geom_line(aes(y = Letalidade),
            color = "orange",
            group = 1) +
  labs(
    title = "2020",
    subtitle = "Porcentagem da Letalidade",
    x = "Meses",
    y = "Porcentagem (%)",
    fill = "Letalidade")

ggarrange(p5, p6,
          labels = c("A", "B"),
          ncol = 1, nrow = 2)

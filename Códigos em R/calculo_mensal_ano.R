library(tidyverse, warn.conflicts = FALSE)
library(xlsx)
library(readxl)

if (!is.null(getwd())) setwd("D:/Users/Eduardo/Documents/BI/PB");

# Recebendo os dataframes.
p2020 <- read.xlsx("D:/Users/Eduardo/Documents/BI/PB/COVIDRJ_2020.xlsx", sheetName = "Sheet1")
p2021 <- read.xlsx("D:/Users/Eduardo/Documents/BI/PB/COVIDRJ_2021.xlsx", sheetName = "Sheet1")
p2022 <- read.xlsx("D:/Users/Eduardo/Documents/BI/PB/COVIDRJ_2022.xlsx", sheetName = "Sheet1")

Mes <- c("Janeiro", "Fevereiro", "Março", "Abril", "Maio", "Junho", "Julho",
          "Agosto", "Setembro", "Outubro", "Novembro", "Dezembro")

#Fazendo a view mensal de 2020
view_2020 <- p2020 %>% 
  ungroup() %>%
  mutate(Mes_Cod = format(data, "%m")) %>%
  group_by(Mes_Cod) %>%
  summarise(Casos = sum(casosNovos), Obitos = sum(obitosNovos))

view_2020["Mes"] <- Mes[3:12]

view_2020["Letalidade"] <- round((view_2020$Obitos / view_2020$Casos), 2)

# Ordenando a tabela
order <- c("Mes", "Mes_Cod", "Casos", "Obitos", "Letalidade")
view_2020<- view_2020[, order]

#Fazendo a view mensal de 2021
view_2021 <- p2021 %>% 
  ungroup() %>%
  mutate(Mes_Cod = format(data, "%m")) %>%
  group_by(Mes_Cod) %>%
  summarise(Casos = sum(casosNovos), Obitos = sum(obitosNovos))

view_2021["Mes"] <- Mes

view_2021["Letalidade"] <- 0
view_2021$Letalidade <- round((view_2021$Obitos / view_2021$Casos)*100, 1)

# Ordenando a tabela
order <- c("Mes", "Mes_Cod", "Casos", "Obitos", "Letalidade")
view_2021<- view_2021[, order]

#Fazendo a view mensal de 2022
view_2022 <- p2022 %>% 
  ungroup() %>%
  mutate(Mes_Cod = format(data, "%m")) %>%
  group_by(Mes_Cod) %>%
  summarise(Casos = sum(casosNovos), Obitos = sum(obitosNovos))

view_2022["Mes"] <- Mes[1:4]

view_2022["Letalidade"] <- 0
view_2022$Letalidade <- round((view_2022$Obitos / view_2022$Casos), 2)

# Ordenando a tabela
order <- c("Mes", "Mes_Cod", "Casos", "Obitos", "Letalidade")
view_2022<- view_2022[, order]


write.xlsx(view_2020, "2020_Mensal.xlsx")
write.xlsx(view_2021, "2021_Mensal.xlsx")
write.xlsx(view_2022, "2022_Mensal.xlsx")

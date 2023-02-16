library(tidyverse)
library(xlsx)
library(readxl)

if (!is.null(getwd())) setwd("D:/Users/Eduardo/Documents/BI/PB");

# Recebendo os dataframes.
p2020 <- read.xlsx("D:/Users/Eduardo/Documents/BI/PB/COVIDRJ_2020.xlsx", sheetName = "Sheet1")
p2021 <- read.xlsx("D:/Users/Eduardo/Documents/BI/PB/COVIDRJ_2021.xlsx", sheetName = "Sheet1")
p2022 <- read.xlsx("D:/Users/Eduardo/Documents/BI/PB/COVIDRJ_2022.xlsx", sheetName = "Sheet1")

# Checar os total de dias de 2020 e 2021
dias20 <- as.data.frame(difftime(p2020$data, as.Date("2021-01-01"), units = "days"))
total_dias2020 <- dias20[1,1]
total_dias2020

dias21 <- as.data.frame(difftime(p2021$data, as.Date("2022-01-01"), units = "days"))
total_dias2021 <- dias21[1,1]
total_dias2021

# 2022 vai da data 2022/01/01 até 2022/04/03
dias22 <- as.data.frame(difftime(p2022$data, as.Date("2022-04-04"), units = "days"))
total_dias2022 <- dias22[1,1]
total_dias2022

# Achar o total de dias desses 3 anos
total_dias <- 280 + 365 + 93
total_dias

# Achar o total de casos por ano e comparar o somatório com o último caso acumulado de 2022
total_casos2020 <- sum(p2020$casosNovos)
total_casos2020

total_casos2021 <- sum(p2021$casosNovos)
total_casos2021

total_casos2022 <- sum(p2022$casosNovos)
total_casos2022

1:nrow(p2022)

if((total_casos2020 + total_casos2021 + total_casos2022) == p2022$casosAcumulado[93]){
  # Total de casos acumulados nesses 738 dias é 954092
  TRUE
}

# A porcentagem dos casos de cada ano, levando em consideração 954092 como 100%
porc2020 <- round((total_casos2020 * 100 ) / p2022$casosAcumulado[93], 1)
porc2020

porc2021 <- round((total_casos2021 * 100 ) / p2022$casosAcumulado[93], 1)
porc2021

porc2022 <- round((total_casos2022 * 100 ) / p2022$casosAcumulado[93], 1)
porc2022

if((porc2020 + porc2021 + porc2022) == 100){
  # Somatório das porcentagens é igual a 100
  TRUE
}

# Gerando um data frame juntando as respostas adquiridas
years <- c(2020, 2021, 2022)
view1 <- as.data.frame(years)
view1["Days"] <- c(280, 365, 93)
view1["casosAcumulado"] <- c(total_casos2020, total_casos2021, total_casos2022)
view1["porcentagemCaso"] <- c(porc2020, porc2021, porc2022)

#Salvando a tabela view 1 em excel
write.xlsx(view1, "Casos_Contaminação_Anual.xlsx")

# Calculando o total de obitos por ano
total_obitos2020 <- sum(p2020$obitosNovos)
total_obitos2020

total_obitos2021 <- sum(p2021$obitosNovos)
total_obitos2021

total_obitos2022 <- sum(p2022$obitosNovos)
total_obitos2022

if((total_obitos2020 + total_obitos2021 + total_obitos2022) == p2022$obitosAcumulado[93]){
  TRUE
}

# Calculando a porcentagem de obitos por ano
porc2020 <- round((total_obitos2020 * 100 ) / p2022$obitosAcumulado[93], 1)
porc2020

porc2021 <- round((total_obitos2021 * 100 ) / p2022$obitosAcumulado[93], 1)
porc2021

porc2022 <- round((total_obitos2022 * 100 ) / p2022$obitosAcumulado[93], 1)
porc2022

if((porc2020 + porc2021 + porc2022) == 100){
  # Somatório das porcentagens é igual a 100
  TRUE
}

# Gerando um data frame juntando as respostas adquiridas
years <- c(2020, 2021, 2022)
view2 <- as.data.frame(years)
view2["Days"] <- c(280, 365, 93)
view2["obitosAcumulado"] <- c(total_obitos2020, total_obitos2021, total_obitos2022)
view2["porcentagemObito"] <- c(porc2020, porc2021, porc2022)

# Gerando o arquivo excel da tabela de obitos anuais
write.xlsx(view2, "Casos_Obito_Anual.xlsx")

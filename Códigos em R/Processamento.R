library(tidyverse)
library(xlsx)

# Achar a pasta do trabalho
if (!is.null(getwd())) setwd("D:/Users/Eduardo/Documents/BI/PB");

# Criar duas vari?veis para receber as duas partes de 2020 da fonte escolhida
p1_20 <- read.csv("D:/Users/Eduardo/Documents/BI/PB/HIST_PAINEL_COVIDBR_2020_Parte1_03abr2022.csv", header = TRUE, sep = ";")
p2_20 <- read.csv("D:/Users/Eduardo/Documents/BI/PB/HIST_PAINEL_COVIDBR_2020_Parte2_03abr2022.csv", header = TRUE, sep = ";")

# Criar mais duas vari?veis atrav?s do m?todo de filtra??o das bases
rj_1 <- p1_20 %>% filter(municipio == "Rio de Janeiro")
rj_2 <- p2_20 %>% filter(municipio == "Rio de Janeiro")

# Juntar as duas bases em uma s?
rj <- rbind(rj_1, rj_2)

# Excluir as colunas que possuem valores "NA"
rj$Recuperadosnovos <- NULL
rj$emAcompanhamentoNovos <- NULL

# Escrever um arquivo xlsx para salvar a base utiliz?vel
write.xlsx(rj,file="COVIDRJ_2020.xlsx")

# Criar duas vari?veis para receber as duas partes de 2021 da fonte escolhida
p1_21 <- read.csv("D:/Users/Eduardo/Documents/BI/PB/HIST_PAINEL_COVIDBR_2021_Parte1_03abr2022.csv", header = TRUE, sep = ";")
p2_21 <- read.csv("D:/Users/Eduardo/Documents/BI/PB/HIST_PAINEL_COVIDBR_2021_Parte2_03abr2022.csv", header = TRUE, sep = ";")

# Criar mais duas vari?veis atrav?s do m?todo de filtra??o das bases
rj_1 <- p1_21 %>% filter(municipio == "Rio de Janeiro")
rj_2 <- p2_21 %>% filter(municipio == "Rio de Janeiro")

# Juntar as duas bases em uma s?
rj <- rbind(rj_1, rj_2)

# Excluir as colunas que possuem valores "NA"
rj$Recuperadosnovos <- NULL
rj$emAcompanhamentoNovos <- NULL

# Escrever um arquivo xlsx para salvar a base utiliz?vel
write.xlsx(rj,file="COVIDRJ_2021.xlsx")

# Criar uma vari?vel para receber as parte de 2022 da fonte escolhida
p_22 <- read.csv("D:/Users/Eduardo/Documents/BI/PB/HIST_PAINEL_COVIDBR_2022_Parte1_03abr2022.csv", header = TRUE, sep = ";")

# Criar mais uma vari?vel atrav?s do m?todo de filtra??o da base
rj <- p_22 %>% filter(municipio == "Rio de Janeiro")

# Excluir as colunas que possuem valores "NA"
rj$Recuperadosnovos <- NULL
rj$emAcompanhamentoNovos <- NULL

# Escrever um arquivo xlsx para salvar a base utiliz?vel
write.xlsx(rj,file="COVIDRJ_2022.xlsx")
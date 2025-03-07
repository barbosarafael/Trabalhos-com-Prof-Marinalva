#-------------------------

#--- Nome: Script_Marinalva_12022020.R


#--- Objetivo: Cria��o de um gr�fico


#--- Autor: Rafael Barbosa da Silva
#--- e-mail: lul.rafaelbarbosa@gmail.com


#--- Data de cria��o: 11/02/2020

#-------------------------


#--- Limpando o ambiente


rm(list = ls())


#--- Setando o diret�rio do banco de dados


setwd("F:/UFPA/Trabalhos/Marinalva_12022020")


#--- Pacotes usados


if(!require(tidyverse)) {
  install.packages("tidyverse", dependencies = T);
  require(tidyverse)
}


if(!require(readr)) {
  install.packages("readr", dependencies = T);
  require(readr)
}


#--- Carregando os banco de dados


banco <- read.csv(file = "0-4 anos 2008-15.csv", sep = ";", skip = 6,
                  header = T, stringsAsFactors = F)

#--- Verificar a estrutura dos dados


banco %>% glimpse


#--- Excluindo os nulos que ficaram nas �ltimas linhas e o total


novo_banco <-
  banco %>%
  drop_na %>%
  filter(Munic�pio != "Total") %>%
  mutate(Novo_Codigo = str_sub(string = Munic�pio, start = 1, end = 6)) %>%
  mutate(Novo_Municipio = str_sub(string = Munic�pio, start = 8)) %>%
  select(Novo_Codigo, Novo_Municipio, Munic�pio:X2015)


#--- Salvando em xlsx


novo_banco %>%
  xlsx::write.xlsx(x = ., file = "Banco_Municipios_Codigos.xlsx")

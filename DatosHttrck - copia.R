library(tidyverse)
library(stringr)
library(lubridate)

rm(list = ls())

setwd("C:/Users/CCardona/OneDrive - ACDI VOCA/Mis Documentos/Westing/Httrck/")

file_names <- list.files(path = "C:/Users/CCardona/OneDrive - ACDI VOCA/Mis Documentos/Westing/Httrck/",
                         pattern = ".csv")
final_output <- purrr::map_df(file_names, function(x) {
  
  data <- read_csv(x)
  cbind(file_id = x, data)
  
})

Datos <- final_output %>% 
  mutate(Fecha = substr(file_id, 9,18)) %>%
  separate(Fecha, into = c("Dia", "Mes", "Anio"), sep = "_",remove = FALSE) %>% 
  mutate(Fecha = gsub("_","-",Fecha)) %>% 
  mutate(Fecha = dmy(Fecha))





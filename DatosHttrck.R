
setwd("C:/Users/CCardona/OneDrive - ACDI VOCA/Mis Documentos/Westing/Httrck/")

file_names <- dir("C:/Users/CCardona/OneDrive - ACDI VOCA/Mis Documentos/Westing/Httrck/") 

Datos <- do.call(rbind, lapply(file_names, function(x) cbind(read.csv(x), name=strsplit(x,'\\.')[[1]][1])))





filenames <- list.files(path = "C:/Users/CCardona/OneDrive - ACDI VOCA/Mis Documentos/Westing/Httrck/", full.names = TRUE)
my.df <- do.call(rbind,
                 lapply(filenames, function(x) 
                   cbind(read.csv(x), 
                         name = tools::file_path_sans_ext(basename(x)))))

temp = list.files(pattern="*.csv")
myfiles = lapply(temp, read.delim)

for (i in 1:length(temp)) assign(temp[i], read.csv(temp[i]))


path = "C:/Users/CCardona/OneDrive - ACDI VOCA/Mis Documentos/Westing/Httrck/"

l = list.files(path, pattern = ".csv")
# below func does importing and creation of new columns
func <- function(i){
  df <- read.csv(paste0(path,l[i]))
  names <- unlist(strsplit(l[i], "_"))
  df["BodyPart"] <- names[1]
  df["Name"] <- names[2]
  return(df)
}

l1 = lapply(1:length(l), func)

l2 <- cbind(l1)

l3 <- as.data.frame(l2)

file_names <- dir("C:/Users/CCardona/OneDrive - ACDI VOCA/Mis Documentos/Westing/Httrck/") 
df <- do.call(rbind, lapply(file_names, function(x) cbind(read.csv(x), name=strsplit(x,'\\.')[[1]][1])))

filenames <- list.files("C:/Users/CCardona/OneDrive - ACDI VOCA/Mis Documentos/Westing/Httrck/", pattern="*.csv", full.names=TRUE)
la <- lapply(filenames, read.csv)

library(tidyverse)

dat_files <- list.files("C:/Users/CCardona/OneDrive - ACDI VOCA/Mis Documentos/Westing/Httrck/", pattern='*.csv')

map_df(dat_files, ~read_csv(.x) %>%
         mutate(month_year = str_remove_all(.x, ".csv", "")) %>%
         separate(month_year, into=c("Month", "Year"), sep=" ")
)


library(tidyverse)
library(stringr)

list_of_files <- list.files(path = "C:/Users/CCardona/OneDrive - ACDI VOCA/Mis Documentos/Westing/Httrck/",
                            pattern = ".csv",
                            full.names = TRUE)
df <- list_of_files %>%
  setNames(nm = .) %>% 
  map_df(~read_csv(.x, col_types = cols(), col_names = TRUE), .id = "file_name") 

list_of_files

file_names

file_names <- list.files(path = "C:/Users/CCardona/OneDrive - ACDI VOCA/Mis Documentos/Westing/Httrck/",
                         pattern = ".csv")
final_output <- purrr::map_df(file_names, function(x) {
  
  data <- read_csv(x)
  cbind(file_id = x, data)
  
})


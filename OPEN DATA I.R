
# ID SCRIPT ---------------------------------------------------------------

## LENGUAJES DE PROGRAMACION ESTADISTICA
## PROFESOR: CHRISTIAN SUCUZHANAY AREVALO
## ALUMNO: PABLO DORREGO, EXP 22040682
## OPEN DATA I


# DATASET -----------------------------------------------------------------
library(httr)
#df<-httr::GET("https://www.kaggle.com/datasets/vaske93/fifa-ballon-dor-2021-nominees/download?datasetVersionNumber=1")
#Imposible importar desde kaggle directamente, ya que exige usuario.
library(tidyverse)
df<-readr::read_csv("C:/Users/paodo/Downloads/all_candidates.csv")
glimpse(df)

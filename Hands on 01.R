
# ID SCRIPT ---------------------------------------------------------------

## LENGUAJES DE PROGRAMACION ESTADISTICA
## PROFESOR: CHRISTIAN SUCUZHANAY AREVALO
## ALUMNO: PABLO DORREGO, EXP 22040682
## HANDS ON 01

# SHORTCUTS ---------------------------------------------------------------

## ctrl + l = clean console
## ctrl + shift + r = new section
## ctrl + enter = run

# LOADING LIBS ------------------------------------------------------------

install.packages("tidyverse","httr","janitor") 
library(tidyverse)
## httr buscar archivos de internet
## janitor formatear y limpiar los datos
#:: dos puntos te dice los compandos del paquete
install.packages("pacman") # gestor de paquetes pro
# GIT COMMANDS ---------------------------------------------------------
#git status 
#git init
#git add
#git commit -m "message"
#git push -u origin main
#git branch Pao - crear nuevo branch
#git merge
#git remote add origin https://github.com/sukuzhanay/LPE21535220.git
#git clone https://github.com/sukuzhanay/LPE21535220.git
#git pull
#git fetch
#git checkout nombrebranch-cambiar de rama

# TERMINAL COMMANDS -------------------------------------------------------
#ls
#cd
#cd..
#pwd
#mkdir
#touch
#nano
#less 
#cat
#where
#which

# BASIC OPERATORS ---------------------------------------------------------

Pao <- 20 
clase_lep <- c("Marta","Emilia","Pablo") ##combine()
install.packages(c("tidyverse", "httr", "janitor"))
##  %>% ctrl + shift + m (pipe)
df<-GET("https://sedeaplicaciones.minetur.gob.es/ServiciosRESTCarburantes/PreciosCarburantes/EstacionesTerrestres/")

# READING AND WRITTING ----------------------------------------------------

library(tidyverse)
glimpse(preciosEESS_es)#se usa mazo invierte la tabla 

library(xml2)
library(httr)
res_<-GET("https://sedeaplicaciones.minetur.gob.es/ServiciosRESTCarburantes/PreciosCarburantes/EstacionesTerrestres/")
xml2::read_xml(res_$content) # $ acceder dentro

library(jsonlite)
url_<-"https://sedeaplicaciones.minetur.gob.es/ServiciosRESTCarburantes/PreciosCarburantes/EstacionesTerrestres/"
f_raw<-jsonlite::fromJSON(url_)
df_source<-f_raw$ListaEESSPrecio %>% glimpse()

janitor::clean_names(df_source) %>% glimpse()

type_convert(df_source,locale =)
type
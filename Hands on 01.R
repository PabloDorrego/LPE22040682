
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
#git rm -r --cached borrar la cache
#git rm -r borrar archivos
#git restore --S recuperar archivos borrados
#git diff comparar dos ramas
#git log --oneline hsitorial de commits
#git reset (commit) volver a un checkpoint
#git switch -c (nombre) 
#git merge combinar ramas
#git clean -n borrar archivos untracked

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
datos<-GET("https://sedeaplicaciones.minetur.gob.es/ServiciosRESTCarburantes/PreciosCarburantes/EstacionesTerrestres/")

# READING AND WRITTING ----------------------------------------------------

library(tidyverse)
glimpse(preciosEESS_es)#se usa mazo invierte la tabla 


# GETTING DATA FROM THE INTERNET ------------------------------------------
library(tidyverse)
library(xml2)
library(httr)
res_<-GET("https://sedeaplicaciones.minetur.gob.es/ServiciosRESTCarburantes/PreciosCarburantes/EstacionesTerrestres/")
xml2::read_xml(res_$content) # $ acceder dentro
library(jsonlite)
url_<-"https://sedeaplicaciones.minetur.gob.es/ServiciosRESTCarburantes/PreciosCarburantes/EstacionesTerrestres/"
f_raw<-jsonlite::fromJSON(url_)
df_source<-f_raw$ListaEESSPrecio %>% glimpse()
janitor::clean_names(df_source) %>% glimpse()
#locale() ver configuración del dataset
df<-df_source %>% janitor::clean_names() %>% type_convert(locale=locale(decimal_mark = ","))

# CREATING NEW VARIABLES --------------------------------------------------
#ds22040682
##Clasificacmos por gasolineras bratas y no baratas
df %>% view()
df_low<-df %>% mutate(barato=!rotulo %in% c("CEPSA","REPSOL","BP","SHELL"))
## Cual es el precio medio del gasoleo en las CCAA
df_low %>% select(precio_gasoleo_a,idccaa,rotulo,barato) %>% drop_na() %>% group_by(idccaa) %>% summarise(mean(precio_gasoleo_a)) %>% view()
## Crear nueva columna que identifique el idccaa
ccaa<-c("Andalucía","Aragón","Asturis, Principado","de Balears, Illes"," Canarias","Cantabria","Castilla y León","	Castilla - La Mancha","Cataluña","Comunitat Valenciana","Extremadura","Galicia",	"Madrid", "Comunidad de	Murcia", "Región de Navarra, Comunidad Foral de","País Vasco","Rioja, La","Ceuta","Melilla")
data_frame(ccaa=ccaa) %>% mutate(ccaa, idccaa = row_number()) %>% str()#str() muestra el tipo de dato
id_ccaa<-c("01",'02','03','04','05','06','07','08','09','10','11','12','13','14','15','16','17','18','19')
data_ccaa<-data_frame(ccaa=ccaa,idccaa=id_ccaa) %>% str()#ver el tipo
df_ccaa<-merge(x=df_low,y=data_ccaa,by="idccaa")
#unique(df_low$idccaa) valores unicos de una columna
df_ccaa %>% select(idccaa,ccaa) %>% unique()

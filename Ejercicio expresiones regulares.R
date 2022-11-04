# ID SCRIPT -----------------------------------------------------

## LEGUAJES DE PROGRAMACION ESTADISTICA
## PROFESOR : CHRISTIAN SUCUZHANAY AREVALO
## ALUMNO : PABLO DORREGO, EXP 22040682
## EJERCICIO EXPRESIONES REGULARES

# LOAD LIBS --------------------------------------------------

## Instalamos las librerías necesarias
if(!require("pacman")) install.packages("pacman")
p_load(tidyverse, httr, janitor, magrittr, tidyr)

# IMPORT AND CLEAN DATA ----------------------------------

url_ <- "https://sedeaplicaciones.minetur.gob.es/ServiciosRESTCarburantes/PreciosCarburantes/EstacionesTerrestres/"
f_raw <- jsonlite::fromJSON(url_)
df_source <- f_raw$ListaEESSPrecio %>% as_tibble() %>% view()
df <- df_source %>% janitor::clean_names() %>% type_convert(locale = locale(decimal_mark = ",")) %>% glimpse()


# CREATE NEW COLUMN -------------------------------------------------------

##Entendiendo las franquicias como las gasolineras compuestas por: (marca + nombre)
##por ejemplo BP ROMICA, la expresión regular recoge todos los caracteres hasta encontrar un espacio
df %<>% tidyr::extract(rotulo, c("tipo_gasolinera"),"(.*) ", remove=F) %>%
  mutate(tipo_gasolinera=!tipo_gasolinera %in% c(NA))

df$tipo_gasolinera <- plyr::mapvalues(df$tipo_gasolinera, from = c("TRUE", "FALSE"), to = c("FRANQUICIA", "MARCA"), warn_missing = F)
df %>% view()

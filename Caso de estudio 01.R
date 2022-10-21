# CASE STUDY FROM 0 TO HERO ---------------------------------------------------------------

## LENGUAJES DE PROGRAMACION ESTADISTICA
## PROFESOR: CHRISTIAN SUCUZHANAY AREVALO
## ALUMNO: PABLO DORREGO, EXP 22040682
## CASO DE ESTUDIO 01

browseURL("https://github.com/PabloDorrego/LPE22040682")

# INSTALL LIBRARIES -------------------------------------------------------

if (!require("pacman")) install.packages("pacman")
pacman::p_load(pacman,magrittr,productplots,psych,RColorBrewer,tidyverse)
#pacman - gestro de paquetes
#magrittr - pipe bidereccional
#productplots - plot variables categoricas
#psych - estadistica
#RColorBrewer - colores

# LOAD AND PREPARE DATA ---------------------------------------------------
browseURL("http://j.mp/37Wxvv7")
tipo_happy<-happy # Es formato dataframe (mejor usar formato tibble siempre)
df<-happy %>% as_tibble()
#?happy informacion datset
levels(df$happy) #Check happy levels
df %<>% mutate(happy=fct_rev(happy)) #Reverser levels (con magrittr)

# OUTCOME VARIABLES: HAPPINESS --------------------------------------------

df %>% ggplot()+geom_bar(aes(happy,fill=happy))+
                           theme(axis.title.x =element_blank(),legend.position = "none")
#Frecuencies for happiness
df %>% count(happy)
df %<>% select(happy:health) %>% view()
df %<>% filter(!is.na(happy))

# HAPPINESS AND GENDER -----------------------------------------------------

df %>% ggplot(aes(sex,fill=happy))+geom_bar(position = "fill")

# HAPPINESS AND MARITAL STATUS --------------------------------------------
 
df %>% ggplot(aes(marital,fill=happy))+geom_bar(position = "fill")

# HAPPINESS AND EDUCATION LEVEL -------------------------------------------

df %>% ggplot(aes(degree,fill=happy))+geom_bar(position = "fill")

# HAPPINESS AND MONEY -----------------------------------------------------

df %>% ggplot(aes(finrela,fill=happy))+geom_bar(position = "fill")

# NEW COLUMN MARITAL STATUS TO BINARIE -----------------------------------------------

df %<>%mutate(married = if_else(marital=="married","yes","no")) %>% 
  mutate(married=as_factor(married)) %>% view()

df %>% ggplot(aes(married,fill=happy))+geom_bar(position = "fill")


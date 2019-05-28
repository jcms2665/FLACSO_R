
# 2. Bases de datos

# Objetivo: Importar y exportar archivos con diferentes formatos y
#           hacer operaciones basicas para conocer las bases de datos

# Contenido

#0.  Limpiar el espacio de trabajo
#1.  Instalar/cargar librerías
#2.  Directorio de trabajo
#3.  
#4.  Tipos de datos
#5.  Conversión de datos
#6.  Vectores
#7.  Funciones
#8.  Matrices
#9.  Missing values
#10. Data Frame


#=================================================================================



### Limpiar el espacio de trabajo

#Antes de iniciar a trabajar en **R** conviene limpiar el entorno de trabajo 
            
rm(list=ls())     
graphics.off()    
options(warn=-1)



### Instalar paquetes

#Par dar inicio al análisis conviene preguntarse ¿qué tipo de analisis se va a llevar a cabo?
#¿se van a hacer análisis estadístico?, ¿se harán gráficas?

install.packages("foreign")
install.packages("ggplot2")
install.packages("questionr")

### Cargar librerías

library(base)         # Funciones basicas
library(foreign)      # Manipular diferentes formatos cvs, dta, dbf
library(questionr)    # Tabulados
library(readxl)       # Lee archivos de excel

### Directorio de trabajo

setwd("C:/Users/jmartinez/Desktop/JC") 

### Importar datos

excel<-data.frame(read_excel("sdemt119.xlsx"))
dbf<-data.frame(read.dbf("sdemt119.dbf"))
stata<-data.frame(read.dta("sdemt119.dta"))
cvs<- data.frame(read.table("sdemt119.csv", header=TRUE, sep=","))



### Exportar datos

#Para guardar una base de datos, basta con determinar el tipo de datos que se requieran y elegir la función correspondiente. Si se quiere generar una base de Stata, entonces se selecciona la función:`write.dta`.
#Guardamos en DTA (stata)
write.dta(cvs, "Julio_R.dta")

#Guardamos en DBF (foxpro)
write.dbf(cvs, "Julio_R.dbf")


### Descripción de la base 

names(cvs)
head(cvs,2)


### Frecuencias

wtd.table(cvs$POS_OCU)


### Tabulados

#Tabulados con datos muestrales (sin ponderar)
wtd.table(cvs$SEX,cvs$POS_OCU)


### Etiquetar variables

#Para generar las etiquetas se debe usar la función factor y se debe especificar 3 cosas:
#  * La variable que se va etiquetar
#  * Los valores (levels)
#  * Las etiquetas (labels)

##### Generar etiquetas

cvs$SEX <- factor(cvs$SEX,levels = c(1,2),labels = c("Hombre","Mujer"))

## Tabular variable etiquetada

#Para validar que se haya etiquetado correctamente la variable, se genera un tabulado para analizar el resultado

wtd.table(cvs$SEX)

### Recodificar variables

#Convertir a numéricas
cvs$EDA <-as.numeric(as.character(cvs$EDA))

#Crear nueva variable
cvs$EDA_5categ<-0

#Establecer los rangos
cvs$EDA_5categ[cvs$EDA >= 0 & cvs$EDA <=10] <- 1
cvs$EDA_5categ[cvs$EDA >= 11 & cvs$EDA <=20] <- 2
cvs$EDA_5categ[cvs$EDA >= 21 & cvs$EDA <=30] <- 3
cvs$EDA_5categ[cvs$EDA >= 31 & cvs$EDA <=40] <- 4
cvs$EDA_5categ[cvs$EDA >= 41] <- 5

#Validar con un tabulado
wtd.table(cvs$EDA_5categ)


### Subconjunto de datos

# Seleccionar variables

#Definimos las variables
var<-c("SEX", "POS_OCU")

#Seleccionamos SÓLO esas variables
nueva_csv_1 <- cvs[,var]

# Seleccionar casos

nueva_csv_2 <- cvs[ which(as.numeric(cvs$EDA)<18), ]

# Seleccionar variables y casos
nueva_csv_3 <- cvs[ which(as.numeric(cvs$EDA)<18), ]


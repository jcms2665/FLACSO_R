
# 3. Estad�stica Descriptiva

# Objetivo: El objetivo de esta secci�n es hacer inferencia de los
#           datos a partir de medidas de tendencia central

#=================================================================================

#Preguntas de investigaci�n

#En la vida real, uno no se plantea hacer una an�lisis estad�stico sin tener 
#un objetivo o una meta a la cual se quiere llegar. Por este motivo, la pregunta 
#de investigaci�n que guiar� este an�lisis es:
  
#**�Quienes estudian m�s, los hombres o las mujeres?**


#0. Preparar el entorno de trabajo

#Antes de iniciar a trabajar en **R** conviene limpiar el entorno de trabajo 

rm(list=ls())     
graphics.off()    
options(warn=-1)

    #0.1. Instalar paquetes
    
    #Par dar inicio al an�lisis conviene preguntarse �qu� tipo de analisis se va a llevar a cabo?
    #�se van a hacer an�lisis estad�stico?, �se har�n gr�ficas?
    
    install.packages("foreign")
    install.packages("ggplot2")
    install.packages("questionr")


    
    #0.2. Cargar librer�as
    
    library(base)         # Funciones basicas
    library(foreign)      # Manipular diferentes formatos cvs, dta, dbf
    library(questionr)    # Tabulados
    library(ggplot2)
    
    #0.3. Directorio de trabajo
    
    setwd("C:/Users/jmartinez/Desktop/JC/OneDrive - El Colegio de M�xico A.C/Proyecto/FLACSO_R_22052019/Datos/enigh2016_ns_poblacion_dbf")
    
#1. Importar datos

enigh<-data.frame(read.dbf("poblacion.dbf"))

#2. Descripci�n de la base 

names(enigh)
head(enigh,2)


#3. Subconjuntos (hombres y mujeres) 

    #3.1 Convertir a num�rico las variables a utilizar: hor_2 y sexo
    
    enigh$sexo <-as.numeric(as.character(enigh$sexo))
    enigh$hor_2 <-as.numeric(as.character(enigh$hor_2))
    
    #3.2 Hacer una base para hombres y otra para mujeres
    
    enigh_h <- enigh[which(enigh$sexo==1),]
    enigh_m <- enigh[which(enigh$sexo==2),]

#4. Medidas de tendencia central

    
    #4.1 Promedio
        
    mean(enigh_h$hor_2, na.rm = TRUE)
    mean(enigh_m$hor_2, na.rm = TRUE)
    
    #4.2 Mediana
    
    median(enigh_h$hor_2, na.rm = TRUE)
    median(enigh_m$hor_2, na.rm = TRUE)
    
    #4.3 M�nimo
    
    min(enigh_h$hor_2, na.rm = TRUE)
    min(enigh_m$hor_2, na.rm = TRUE)
    
    #4.4 M�ximo
    
    max(enigh_h$hor_2, na.rm = TRUE)
    max(enigh_m$hor_2, na.rm = TRUE)
    
    #4.5 Desviaci�n est�ndar
    
    sd(enigh_h$hor_2, na.rm = TRUE)
    sd(enigh_m$hor_2, na.rm = TRUE)
    
    
    #4.6 Cuartiles
    
    quantile(enigh_h$hor_2, na.rm = TRUE)
    quantile(enigh_m$hor_2, na.rm = TRUE)


#5. Gr�ficas (ggplot)
    
#5.1 Gr�fica simple
    
ggplot(enigh,aes(sexo))+geom_bar(fill="blue")

#5.2 Gr�fica con dise�o

ggplot(enigh,aes(sexo))+geom_bar(fill="blue")+
    xlab("Sexo de las personas")+
    ylab("Numero de personas")+
    ggtitle("Comparaci�n entre hombres y mujeres")



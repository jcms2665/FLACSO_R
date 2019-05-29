
# 3. Estadística Descriptiva

# Objetivo: El objetivo de esta sección es hacer inferencia de los
#           datos a partir de medidas de tendencia central

#=================================================================================

#Preguntas de investigación

#En la vida real, uno no se plantea hacer una análisis estadístico sin tener 
#un objetivo o una meta a la cual se quiere llegar. Por este motivo, la pregunta 
#de investigación que guiará este análisis es:
  
#**¿Quienes estudian más, los hombres o las mujeres?**


#Para dar respuesta a esta pregunta, se va a usar la base de Características 
#sociodemográficas de los integrantes del hogar de la 
#Encuesta Nacional de Ingresos y Gastos de los Hogares 2016:
#https://www.inegi.org.mx/programas/enigh/nc/2016/default.html#Microdatos
#Usar el formato **dbf**. 


#0. Preparar el entorno de trabajo

#Antes de iniciar a trabajar en **R** conviene limpiar el entorno de trabajo 


    #0.1. Instalar paquetes
    
    #Par dar inicio al análisis conviene preguntarse ¿qué tipo de analisis se va a llevar a cabo?
    #¿se van a hacer análisis estadístico?, ¿se harán gráficas?
    
    # Ayuda: Vamos a utilizar los paquetes: base, foreign, questionr,ggplot2
    #       Por lo que antes de instalar, hay que verificar si ya los tenemos instalados



    
    #0.2. Cargar librerías
    

    
    #0.3. Directorio de trabajo
    
    setwd("")
    
#1. Importar datos
    # Ayuda: Recuerda utilizar la función read.dbf
    # Ayuda2: Nombra a la base enigh


#2. Descripción de la base 
    # Ayuda: Verifica el nombre de las variables


#3. Subconjuntos (hombres y mujeres) 

    #3.1 Convertir a numérico las variables a utilizar: hor_2 y sexo
        # Ayuda: Convierte en caracter y luego en numérico.
        # Ayuda2: Recuerda decirle a R el nombre de la base y la variable ($)
    

    #3.2 Hacer una base para hombres y otra para mujeres
        # Ayuda1: Recuerda quienes van antes de la coma: [casos o filas , variables o columnas ]
        # Ayuda2: A la base de hombres nombrala "enigh_h" y a la de mujeres "enigh_m"


#4. Medidas de tendencia central

    
    #4.1 Promedio
        
    mean(enigh_h$hor_2, na.rm = TRUE)
    mean(enigh_m$hor_2, na.rm = TRUE)
    
    #4.2 Mediana
    
    median(enigh_h$hor_2, na.rm = TRUE)
    median(enigh_m$hor_2, na.rm = TRUE)
    
    #4.3 Mínimo
    
    min(enigh_h$hor_2, na.rm = TRUE)
    min(enigh_m$hor_2, na.rm = TRUE)
    
    #4.4 Máximo
    
    max(enigh_h$hor_2, na.rm = TRUE)
    max(enigh_m$hor_2, na.rm = TRUE)
    
    #4.5 Desviación estándar
    
    sd(enigh_h$hor_2, na.rm = TRUE)
    sd(enigh_m$hor_2, na.rm = TRUE)
    
    
    #4.6 Cuartiles
    
    quantile(enigh_h$hor_2, na.rm = TRUE)
    quantile(enigh_m$hor_2, na.rm = TRUE)


#5. Gráficas (ggplot)
    
#5.1 Gráfica simple
    
ggplot(enigh,aes(sexo))+geom_bar(fill="blue")

#5.2 Gráfica con diseño

ggplot(enigh,aes(sexo))+geom_bar(fill="blue")+
    xlab("Sexo de las personas")+
    ylab("Numero de personas")+
    ggtitle("Comparación entre hombres y mujeres")



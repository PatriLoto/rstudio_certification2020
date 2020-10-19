
# Lección 2: Herramientas útiles para manipulación de datos utilizando R

# En la lección utilizaremos los paquetes tidyverse,devtools y guaguas.
## Primer paso: Instalar los paquetes

install.packages("tidyverse")  # incluye los paquetes que vamos a utlizar dplyr, magrittr, ggplot2.
install.packages("devtools")   # este paquete es necesario para instalar el paquete guaguas que por el momento no está disponible en CRAN
devtools::install_github("rivaquiroga/guaguas")  # hermano latinoamericano del paquete babynames

## Paso dos: Llamar a los paquetes anteriormente instalados

library(tidyverse)  # combinacion de paquetes para importar + transformar + visualizar
library(guaguas)

#-------------------------------------------------
### Recordatorio de la clase anterior
# El operador pipe %>%:
# * evita las funciones anidadas
# * permite escribir código  más legible ya que la secuencia de operaciones 
#  * se escribe de izquierda a derecha al igual que la escritura humana. 

# -> Y lo más importante permite concatenar funciones de dplyr.

#-------------------------------------------------

# Principales funciones de dplyr  

## Funciones de dplyr para seleccionar y filtrar

select ()

filter ()

arrange()

## Funciones de dplyr para agregar nuevas columnas

group_by()

summarise()

mutate()  

## Importante: En la clase de hoy, 20 de octubre aprenderemos a utilizar las sentencias select, filter y arrange. 
# cada unda de estas 3 funciones  toma un dataframe o tibble como primer argumento y devuelve un dataframe o tibble como salida
#-------------------------------------------------
# ¡Comencemos!
  
# le echamos un vistazo al conj. de datos

guaguas   

# El dataset contiene nombres de bebés o guaguas registrados en Chile entre 1920 y 2019, 
# según el Servicio de Registro Civil e Identificación.
# Las columnas disponibles son : anio, sexo, nombre, n, proporcion

#-------------------------------------------------
## SELECT
#-------------------------------------------------
# Primera pregunta: ¿Cómo seleccionamos sólo algunas variables de nuestro dataset?

# función select  --> superpoder: extrae columnas de un dataframe 

# sintaxis: select(dataset, variable1,variable2,... variablen) 

## reescribimos la sentencia utilizando pipe
#dataset %>% 
  # select(variable1,variable2,... variablen)

# dataset: conj. de datos sobre el que aplicaremos la función select()
# variable1 a n: variables a seleccionar del dataset

## Objetivo: seleccionar año, nombre y cantidad de ocurrenciasdel dataset guaguas

guaguas %>% 
  select(anio, nombre, n)

#otra forma de escribirlo:
  
guaguas %>% 
  select(-sexo, proporcion)  # también puede utilizarse el símbolo !

## Consigna: ¿Con cuál opción seleccionamos todas las variables excepto el sexo y cantidad?
## Opciones:

guaguas %>% select(sexo, n)

guaguas %>% select(!c(sexo, n))

guaguas %>% select(guaguas, anio, nombre, proporcion)
  
## Si tienes dudas, puedes ejecutarlas y ver que resultados obtienes.

#-------------------------------------------------
# FILTER
#-------------------------------------------------
# Segunda pregunta: ¿Cómo filtramos y creamos subconjuntos de datos en R?


# función filter  --> superpoder: extrae filas de un dataframe por sus valores
# sintaxis: filter(dataset, condicion1, condicion2,...condicionn)

## reescribimos la sentencia utilizando pipe
#dataset %>% 
  ## filter(condicion1, condicion2,...condicion n)


#dataset: conj. de datos sobre el que aplicaremos la función filter()
#condiciones1 a n: condiciones o test lógico para el filtrado de datos

# Algunos operadores vistos en las clases anteriores que nos ayudarán 
# ==
# >
# >=
# <=
# !  

## Objetivo: filtrar los nombres de mujeres a partir del año 2010
 
guaguas %>%
  filter(sexo == 'F', anio> 2009)


# Recordemos los Principales operadores lógicos para unir condiciones, también nos serán de utilidad
# &	Ejemplo: A & B evalúa --> ¿Son verdad tanto A como B?
# |	Ejemplo: A | B evalúa --> ¿Son verdaderas una o ambas de A y B?	
# ! Ejemplo:	!A   evalúa --> ¿A no es cierto?


## Consigna: En Chile un nombre muy popular es Salvador por Salvador Allende
## ¿Con cuál opción filtramos aquellas filas que contengan el nombre Salvador a partir del año de su fallecimiento (1973)?
## Opciones: 
  
guaguas %>% filter (name = "Salvador", anio >=1973)  
  
guaguas %>% filter (anio >= 1973 & nombre == "Salvador") 

guaguas %>% filter (nombre == "Salvador", anio == 1973)
  
## Prestá atención a los detalles y Si tienes dudas, puedes ejecutarlas y ver que resultados obtienes.


#----------------------------------------------------------
## Ejercicio combinando select y filter

## Nos interesa conocer si a partir de 1957 (año de fallecimieto de la escritora Gabriela Mistral) aumento la cantidad de personas 
## llamadas Gabriela, entonces:
# - es necesario seleccionar las variables de interés: nombre, cantidad, proporción y año
# - luego debemos filtrar por el nombre Gabriela a partir de 1940 hasta el año 2019 para comparar la ocurrencia de cada año


# Por favor, completa el ejercicio de acuerdo al objetivo planteado:
  
  
guaguas %>% ----(---, n, proporcion, anio) %>% 
            -----(nombre == ---- ,---- > 1940)


## Resuelto 
guaguas %>% select(nombre, anio, n, proporcion) %>% 
  filter(nombre == "Gabriela" ,anio > 1940) 

### ¡Tené en cuenta!
# Si la consola nos muestra resultados sólo de algunos años, entonces recorda que es posible utilizar la función view() aprendida en la clase anterior para visualizar 
# los resultados completos desde el año 1940 hasta el año 2019.

guaguas %>% select(nombre, anio, n, proporcion) %>% 
  filter(nombre == "Gabriela" ,anio > 1940) %>% view()

# Conclusión: se observa un leve aumento en la cantidad de guaguas llamadas Gabriela a partir de 1957 
# pero el boom se da a finales de la década del 80 y principios de la década del 90.

#----------------------------------------------------------

#Referencias

# R para Ciencia de Datos de Hadley Wickham: https://es.r4ds.hadley.nz/
# Documentación de dplyr: https://dplyr.tidyverse.org/
# Primers de Rstudio: https://rstudio.cloud/learn/primers
# Paquete guaguas desarrollado por Riva Quiroga: https://github.com/rivaquiroga/guaguas
# Manipulación de datos: https://github.com/djnavarro/robust-tools/blob/master/static/dancing/index.Rmd
# Taller primeros pasos en R: https://github.com/rivaquiroga/RLadies-Santiago/blob/master/2018-04_taller_primeros_pasos_en_R.Rmd
# Introducción a R: https://github.com/jbkunst/puc-introduccion-a-R

# Si te interesa ingresar por Rstudio Cloud: https://rstudio.cloud/project/1782608
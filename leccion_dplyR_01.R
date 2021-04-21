# Lección 2: Herramientas útiles para manipulación de datos utilizando R y dplyr

# En la presente lección utilizaremos los paquetes tidyverse y guaguas.

## PRIMER PASO: Instalar los paquetes

# tidyverse es una colección de paquetes, entre los que se encuentran dplyr y magrittr, que utilizaremos en el día de hoy.

install.packages("tidyverse")      

# el paquete devtools es necesario para instalar el paquete guaguas ya que no está disponible en CRAN

install.packages("devtools")  

# hermano latinoamericano del paquete babynames

devtools::install_github("rivaquiroga/guaguas")  


## SEGUNDO PASO: Llamar a los paquetes anteriormente instalados

library(tidyverse)  
library(guaguas)

#-------------------------------------------------
### Recordatorio de la clase anterior

# El operador pipe %>%:

# * evita las funciones anidadas

# * permite escribir código  más legible ya que la secuencia de operaciones 

# * se escribe de izquierda a derecha al igual que la escritura humana. 

# -> Y lo más importante es que permite concatenar funciones de dplyr.

#-------------------------------------------------

# Principales funciones de dplyr  

## Hoy aprenderemos las funciones de dplyr para seleccionar y filtrar:

select ()

filter ()

arrange()

## Importante: Las sentencias select y filter toma un dataframe o tibble como primer argumento y devuelve un dataframe o tibble como salida.


##  En la próxima clase aprenderemos las funciones de dplyr para agregar nuevas columnas:

# group_by(), summarise() y mutate()  

#-------------------------------------------------

# ¡Comencemos!
  
# Ejecutemos la siguiente sentencia para conocer que contiene el conj. de datos:

guaguas   


# El dataset contiene nombres de bebés o guaguas registrados en Chile entre 1920 y 2019, según el Servicio de Registro Civil e Identificación.

# Las columnas disponibles son : anio, sexo, nombre, n, proporcion


#-------------------------------------------------
## SENTENCIA SELECT
#-------------------------------------------------

# Primera pregunta: ¿Cómo seleccionamos sólo algunas variables de nuestro dataset?

# función select  --> superpoder: extrae columnas de un dataframe 

# sintaxis: 
#        select(dataset, variable1,variable2,... variable n) 

## reescribimos la sentencia utilizando el operador pipe:

#        dataset %>% 
#           select(variable1,variable2,... variablen)

# - dataset: conj. de datos sobre el que aplicaremos la función select()

# - variable1 a n: variables a seleccionar del dataset



## Objetivo: seleccionar año, nombre y cantidad de ocurrencias del dataset guaguas

guaguas %>% 
  select(anio, nombre, n)


# otra forma de escribirlo:
  
guaguas %>% 
  select(-sexo, proporcion)  # también puede utilizarse el símbolo ! para excluir determinados campos


## Ejercicio: ¿Con cuál opción seleccionamos todas las variables excepto el sexo y cantidad?

## Opciones:

guaguas %>% select(sexo, n)

guaguas %>% select(!c(sexo, n))

guaguas %>% select(guaguas, anio, nombre, proporcion)
  
## Si tienes dudas, puedes ejecutar las anteriores sentencias y ver qué resultados obtienes.


#-------------------------------------------------
# SENTENCIA FILTER
#-------------------------------------------------

# Segunda pregunta: ¿Cómo filtramos y creamos subconjuntos de datos en R?


# función filter  --> superpoder: extrae filas de un dataframe por sus valores

# sintaxis: 

#        filter(dataset, condicion1, condicion2,...condicion n)

## reescribimos la sentencia utilizando pipe

#       dataset %>% 
##            filter(condicion1, condicion2,...condicion n)


# - dataset: conj. de datos sobre el que aplicaremos la función filter()

# - condicion 1 a n: condiciones o tests lógicos para el filtrado de datos

# Algunos operadores vistos en las clases anteriores que nos ayudarán:

# ==
# >
# >=
# <=
# !  


## Objetivo: filtrar los nombres de mujeres con n mayor a 500 entre 2010 y 2019.
 
guaguas %>%
  filter(sexo == 'F', n > 500, anio >= 2010, anio <= 2019) 


# Recordemos los principales operadores lógicos para unir condiciones:

# &	Ejemplo: A & B evalúa --> ¿Son verdad tanto A como B?

# |	Ejemplo: A | B evalúa --> ¿Son verdaderas una o ambas de A y B?	

# ! Ejemplo:	!A   evalúa --> ¿A no es cierto?




## Ejercicio: En Chile un nombre muy popular es Salvador por el Presidente Salvador Allende. 

# Si quisieramos conocer el nro. de ocurrencias de dicho nombre durante su mandato (1970-1973) ¿Cuál opción elegiríamos?

## Opciones: 
  
guaguas %>% 
  select (nombre == "Salvador", anio >= 1970, anio <= 1973) 

guaguas %>% 
  filter (nombre == "Salvador" | anio >= 1970 | anio <=  1973)

guaguas %>% 
  filter (nombre == "Salvador", between(anio, 1970, 1973))

  
## Prestá atención a los detalles y Si tienes dudas, puedes ejecutarlas y ver que resultados obtienes.


#----------------------------------------------------------
## Ejercicio combinando select y filter


## Nos interesa conocer si a partir de 1957 (año de fallecimiento de la escritora Gabriela Mistral) aumento la cantidad de personas 
## llamadas Gabriela, entonces:

# 1- es necesario seleccionar las variables de interés: nombre, cantidad, proporción y año

# 2- luego debemos filtrar por el nombre Gabriela a partir de 1957 para comparar la ocurrencia de cada año


# Por favor, completa el ejercicio de acuerdo al objetivo planteado:
  
  
`guaguas %>% ----(---, n, proporcion, anio) %>% 
            -----(nombre == ---- ,---- > 1957)`


## Resolución: 

guaguas %>% select(nombre, anio, n, proporcion) %>% 
  filter(nombre == "Gabriela" & anio > 1957) 



### ¡Tené en cuenta!
# Si la consola muestra resultados sólo de algunos años, entonces recordá que es posible utilizar la función view() aprendida en la clase anterior para visualizar 
# los resultados completos.

guaguas %>% select(nombre, anio, n, proporcion) %>% 
  filter(nombre == "Gabriela" & anio > 1957) %>% view()


# Conclusión: se observa un leve aumento en la cantidad de guaguas llamadas Gabriela a partir de 1957 
# pero el boom se da a finales de la década del 80 y principios de la década del 90.

#----------------------------------------------------------

# Referencias:
# - R para Ciencia de Datos de Hadley Wickham: https://es.r4ds.hadley.nz/
# - Documentación de dplyr: https://dplyr.tidyverse.org/
# - Primers de Rstudio: https://rstudio.cloud/learn/primers
# - Paquete guaguas desarrollado por Riva Quiroga: https://github.com/rivaquiroga/guaguas


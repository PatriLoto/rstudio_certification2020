
# Clase para la certificación de Rstudio

# Contenido:

## Learner Persona

* Una learner persona para caracterizar a una persona tipo destinataria de la presente lección.

## Mapa Conceptual

* Un mapa conceptual sobre el contenido de la lección, el cual servirá de guía al estudiante.

## Material que se usará durante la lección.
**Slides**
**Código**

## Ejercicios para la Evaluación formativa
* Ejercicios del tipo pregunta de opción múltiple y del tipo fill_the_blanks.

### Learner Persona 🙎‍♂️ 🙎‍♀️

En la siguiente descripción se detalla el contexto, experiencia relevante, necesidades y consideraciones especiales del estudiante para cual está pensada la presente lección.

Andrea, tiene 33 años, es colombiana y hace algunos años vive en Argentina, es estudiante avanzada de Sociología de la UBA, y actualmente está en la búsqueda de material para el desarrollo de su tesis en el que analizará la participación de las mujeres en la política argentina desde 1947, año en que se promulgó la ley de sufragio femenino en el país, hasta la actualidad, y el cual es el último requisito para obtener su título de grado. Andrea, es una persona usuaria de Excel y hasta el momento le fue de utilidad para cargar datos y procesarlos pero en este período se dio cuenta que para el desarrollo de su tesis necesitará una herramienta más versátil que excel, que le permita procesar mayor cantidad de datos en menos tiempo. Además, algunas compañeras que ingresaron a trabajar como investigadoras, le recomendaron aprender R para manipular los datos de su tesis de manera ordenada y reproducible y le comentaron que le será de utilidad en cada etapa de su investigación (lectura, limpieza, procesamiento, visualización y comunicación de sus datos). Como es proactiva, Andrea ya está en la búsqueda de un curso introductorio que le permita aprender las habilidades principales del análisis de datos en un tiempo corto. Además de estudiar trabaja a tiempo completo, por lo que no dispone de mucho tiempo libre. El horario de cursado  será un factor decisivo a la hora de seleccionar un curso. 

 
## Sobre la clase de hoy 👩‍🏫

Esta lección es parte de un curso cuatrimestral para estudiantes de Ciencias Sociales denominado **Primeros pasos en R para personas de Ciencias Sociales**. El curso incluye las habilidades necesarias para llevar adelante un proyecto de análisis de datos: lectura y limpieza, manipulación, visualización y comunicación de datos.

Esta breve lección de 15 minutos es parte del módulo **Herramientas útiles para manipular datos con el paquete dplyr**. 

Los estudiantes han visto en las clases anteriores manejo de la consola, vectores y operaciones, lectura de datos, el operador pipe, la función view, entre otros . 

## Mapa conceptual 🗺️


## Material de la clase 🗂
 * **Slides**
 * **[Proyecto de Rstudio cloud](https://rstudio.cloud/project/1782608)**

## Referencias 📚

* [R para Ciencia de Datos de Hadley Wickham](https://es.r4ds.hadley.nz/)
* [Documentación de dplyr](https://dplyr.tidyverse.org/)
* [Primers de Rstudio](https://rstudio.cloud/learn/primers) 
* [Paquete guaguas desarrollado por Riva Quiroga](https://github.com/rivaquiroga/guaguas)


### Librerias necesarias 
* Tidyverse
* Guaguas

``` r
#Si no tengo instalada la libreria tidyverse
#install.packages("tidyverse")
#devtools::install_github("rivaquiroga/guaguas")

#cargo librerias
library(tidyverse)
library(guaguas)

```

## Evaluación formativa
#### Pregunta 1
``` r
## Ejercicio: ¿Con cuál opción seleccionamos todas las variables de guaguas excepto el sexo y cantidad?
## Opciones:

# a. guaguas %>% select(sexo, n)

# b. guaguas %>% select(!c(sexo, n))   CORRECTA

# C. guaguas %>% select(guaguas, anio, nombre, proporcion)
 
```

#### Solución 1

``` r
# b- guaguas %>% select(!c(sexo, n))   CORRECTA
```

#### Pregunta 2 

```r
## Ejercicio: En Chile un nombre muy popular es Salvador por Salvador Allende
  ¿Con cuál opción filtramos aquellas filas que contengan el nombre Salvador a partir del año de su fallecimiento (1973)?
## Opciones: 
  
a. guaguas %>% filter (name = "Salvador", anio >=1973)  
  
b. guaguas %>% filter (anio >= 1973 & nombre == "Salvador")   CORRECTA

c. guaguas %>% filter (nombre == "Salvador", anio == 1973)
  
```

#### Solución 2

```r
guaguas %>% filter (anio >= 1973 & nombre == "Salvador") 
```



#### Pregunta 3

```r

guaguas %>% ----(---, n, proporcion, anio) %>% 
            -----(nombre == ---- ,---- > 1940)
      
```
 #### Solución 3

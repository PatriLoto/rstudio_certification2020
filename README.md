# Contenido:

## Learner Persona

* Una learner persona para caracterizar a una persona tipo destinataria de la presente lección.

## Mapa Conceptual

* Un mapa conceptual sobre el contenido de la lección, el cual servirá de guía al estudiante.

## Ejercicios para la Evaluación formativa

* Ejercicios del tipo pregunta de opción múltiple o problema de Parsons.

## Material que se usará durante la lección.
**Slides**
**Código**


### Librerias necesarias 

``` r
#Si no tengo instalada la libreria tidyverse
#install.packages("tidyverse")

#cargo librerias
library(tidyverse)

```


#### Pregunta 1
``` r
table3 %>%
    separate(__________, 
             c("cases", "population"), 
             sep="__")
```

#### Solución 1

``` r
table3 %>%
    separate(rate, #columna para dividir los datos
             c("cases", "population"), #nuevas columnas
             sep="/") #separador
```

#### Pregunta 2 

```r
table1 %>%
  unite("rate",
        _____, _________,
        sep="__")
```



#### Solución 2

```r
table1 %>%
  unite("rate",
        cases, population,
        sep="/")
```





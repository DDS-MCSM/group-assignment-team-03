# Group Assignment - Data Driven Security

Group Assignment base repository for the Data Driven Security subject of the [CyberSecurity Management Msc](https://www.talent.upc.edu/ing/professionals/presentacio/codi/221101/cybersecurity-management/).

## Project Title

Que porcentaje de acierto en phising se puede conseguir al analizar una url?

### Requirements

  - Datasets de páginas de phishing.
  - Datasets de páginas web generales.
  - Herramienta para extraer datos de una página web.
  
  
### Project Description

Elaborar un método de data mining sobre una base de datos de página de phishing para saber si una página en concreto es de phishing o no.
Crear un web crawler para tener una base de datos de páginas web aleatorias. 
Utilizar data mining para agrupar las páginas (si son phishing o no). 
Extraer los datos de las páginas detectadas como phishing y crear un análisis (por origen, media, etc).

### Goals

Hacer un análisis funcional sobre el phishing (como detectarlo, origen de los servidores, número de páginas, etc).

### Data acquisition

- Kaggle: Obtención de los datasets de phising  
- Alexa: Obtención de webs legítimas para aplicar phising.
- Web crawler.
- Herramienta para extraer datos de dominios.

### Cleansing and transformations

- Mediante el fichero que hemos obtenido de datasets sobre phising, hemos seleccionado los campos que utilizaremos para que haga la comparación de si una url es phising o no. 
Se ha realizado una limpieza del fichero de dataset y los campos en los que nos hemos centrado han sido:

  - index 
  - having_IPhaving_IP_Address
  - URLURL_Length
  - Shortining_Service
  - having_At_Symbol
  - double_slash_redirecting
  - Prefix_Suffix
  - having_Sub_Domain
  - HTTPS_token

Estos campos se han copiado en otro fichero para la comparación a la hora de aplicar el algoritmo.

- Para obtener las webs legítimas, se han extraido del top 500 de "Alexa". 
  Estos datos extraídos se han pasado por un código R que rellena un csv y se han descartado las características que eran menos   relevantes a través del algoritmo "Naive Bayes". 


### Data analysis

- Análisis de datos phising obtenidos del dataset y transformados a otro fichero csv para obtener los campos requeridos.
- Análisis de datos de webs legítimas y transformados a otro fichero csv para obtener los campos requeridos.
- Comparar ambos a través del algoritmo "Naive Bayes" para obtener un porcentaje ajustado de análisis de phising.  


### Results / Conclusions.

Utilizando el algoritmo de "Naive Bayes" junto con el "Principal Component Analysis (PCA)" para reducir la dimensionalidad de los datos, hemos obtenido unos resultados del 75% de exactitud. 
Es un porcentaje bastante alto de exactitud, mejor del que habíamos pensado, pero si hubieramos obtenido herramientas más avanzadas ese porcentaje lo hubieramos podido aumentar.

Para un siguiente "aproach", podríamos mejorar ese porcentaje de exactitud y también aplicarlo para hacer un análisis de países, para de esta manera, poder determinar donde hay más enfoque de phising. 

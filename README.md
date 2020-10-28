# Preprocesamiento-BCI-IV-2a
## El preprocesamiento es el siguiente:
Subconjuntos.m --> Unir --> FiltroMedianaNaN.m --> Car.m --> FiltroPasaBanda.m --> AcomodarDatos.m

### Subconjuntos.m
Obtenemos los 4seg de MI del segundo 3 al 7
* Input: (Bab.gdf)
* Output: (MIab.mat)
* Input Shape: todox6
* Output Shape: (n_muestra * 1000) x 3

Se necesita ejecutar biosig_installer.m

### Unir.m
Unir subconjuntos
* Input: (MIab.mat)
* Output: (MI_b_a.mat)
* Input Shape: (n_muestra * 1000) x 3
* Output Shape: (n_muestra * 1000) x 3

### FiltroMedianaNaN.m
Reemplazar NaN por los valores obtenidos con el filtro mediana de orden 255
* Input: (MI_b_a.mat)
* Output: (Limpios_b_a.mat)
* Input Shape: (n_muestra * 1000) x 3
* Output Shape: (n_muestra * 1000) x 3

### Car.m
Referencia CAR (common average reference)
* Input: (Limpios_b_a.mat)
* Output: (CarBab.mat)
* Input shape: (n_muestra * 1000) x 3
* Output shape: (n_muestra * 1000) x 3

### FiltroPasaBanda.m
Filtro pasa banda de 8Hz-30Hz
* Input: (CarBab.mat)
* Output: (FiltradasBab.mat)
* Input shape: (n_muestra * 1000) x 3
* Output shape: (n_muestra * 1000) x 3

### AcomodarDatos.m
Acomodar los datos para que queden concatenados los canales [n_muestras, n_canales]
* Input: (FiltradasBab.mat)
* Output: (MI-EEG-Bab.csv) es para el entrenamiento de los modelos
* Input shape: (n_muestra * 1000) x 3
* Output shape: n_muestras * 3000

Las filas son el numero de muestras y las columnas son los 4 seg de los 3 canales concatenados (3000)

### Etiquetas.m
Unir etiquetas
* Input: (Bab.mat)
* Output: (etiquetas_b_a)

#### Otros archivos que no se utilizan
* ContarNaN.m

Nota: a: número de los nueve sujetos (0100 a 0900), b: train (T) o test (E)
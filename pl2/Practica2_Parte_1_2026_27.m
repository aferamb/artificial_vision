%[text]{"align":"center"} # Sistemas de Visión Artificial
%[text]{"align":"center"} # **Práctica 2. Técnicas Básicas de Procesamiento de Imágenes**
%[text] 
%[text] 
%[text] **Autor(es):**
%[text] 
%[text] **Fecha:**
%[text] El objetivo de esta práctica es aplicar y analizar algunas de las técnicas básicas de procesamiento de imágenes estudiadas en teoría utilizando la **Image Processing Toolbox de MATLAB**. Se trabajará con transformaciones de intensidad, procesamiento basado en el histograma, transformaciones geométricas, interpolación, generación y reducción de ruido y filtrado espacial.
%[text] En la mayoría de los ejercicios se utilizarán imágenes de intensidad (escala de grises). Cuando se trabaje con imágenes en color deberá tenerse en cuenta su representación y decidir, en función de la operación que se quiera realizar, si conviene procesar directamente la imagen RGB o trabajar sobre alguna de sus componentes. Para realizar los ejercicios pueden utilizarse inicialmente las imágenes disponibles en el Aula Virtual. También pueden utilizarse otras imágenes, siempre que cumplan las características requeridas en cada apartado: imagen RGB o indexada, de bajo contraste, oscura, etc. 
%[text] Antes de procesar una imagen es importante comprobar tanto su **tipo de representación** —RGB, indexada, escala de grises o binaria— como su **clase de datos** (`uint8`, `uint16`, `single`, `double`, `logical`, etc.). La clase determina, entre otras cosas, el rango numérico de los niveles de intensidad y puede condicionar el comportamiento de algunas operaciones. Esto es especialmente importante cuando en los ejercicios no se indica qué conversión debe realizarse o cuando se utilizan imágenes diferentes a las inicialmente indicadas en el enunciado. Si una imagen no tiene la representación o clase de datos adecuados, algunas funciones pueden producir un error —indicando, en ocasiones, el tipo de datos esperado— o proporcionar un resultado inesperado. En cualquiera de los dos casos deberá comprobarse qué tipo de entrada espera la función y realizar, si es necesario, la conversión adecuada.
%[text] **La práctica se completará en este mismo fichero .mlx**, incluyendo el nombre del autor o autores del grupo, la fecha, el código y los comentarios y conclusiones pertinentes en cada apartado. Los distintos apartados deberán estar separados en **secciones independientes** mediante un *section break*. En el código, una nueva sección se introduce escribiendo `%%`, aunque también puede añadirse mediante la opción correspondiente del menú. Cree una nueva figura para cada grupo de resultados que deba mostrarse conjuntamente. Cuando sea necesario comparar varias imágenes, utilice `subplot` o `tiledlayout` y `nexttile`. De esta forma se evita que las imágenes correspondientes a distintos apartados se superpongan o aparezcan asociadas a secciones posteriores.
%[text] De cara a facilitar el aprendizaje y la preparación de los test de laboratorio, se recomienda ampliar la práctica con las explicaciones oportunas, realizar pruebas adicionales (modificando parámetros o utilizando otras imágenes que permitan apreciar mejor determinados efectos del procesamiento) y describir los problemas encontrados durante su realización y las soluciones adoptadas.
%[text] Esta práctica no consiste únicamente en obtener las imágenes solicitadas. Es especialmente importante realizar una **correcta interpretación de los resultados**, justificar los parámetros utilizados y llevar a cabo las pruebas adicionales que resulten necesarias para comprender el efecto de las distintas operaciones.
%[text] La entrega se realizará en el Aula Virtual de la asignatura: **Contenidos → Entregables → Práctica 2**.
%[text] 
%[text]{"align":"center"} 
clear all
close all
%[text] Implemente el siguiente código, visualice los resultados obtenidos y justifíquelos:
%[text] **1.** Abra y visualice al menos dos imágenes en color: una RGB y otra indexada. Determine previamente el tipo de cada imagen utilizando `imfinfo` y consultando el campo `ColorType.` Observe también sus dimensiones, profundidad de bits y clase de datos una vez cargadas en MATLAB.
%[text] Cargue cada imagen utilizando las variables necesarias para conservar correctamente su representación (`I`, `X`, `map`, etc.) y visualícelas en figuras independientes (evitando, en este caso, el comando *subplot*).
%[text] Explique brevemente las diferencias entre la representación RGB y la representación indexada. 

%%
%[text] 2\. Convierta la imagen indexada anterior a escala de grises y denomine `Igris` a la imagen resultante. Sobre `Igris`:
%[text]     2\.1 Realice:
%[text] - una modificación de **brillo**;
%[text] - una modificación de **contraste**. \
%[text] Muestre `Igris` y las imágenes resultantes, junto con sus histogramas. Indique las transformaciones utilizadas, los intervalos inicial y final y justifique, a partir de ellas y de los histogramas, por qué en un caso se modifica el brillo y en el otro el contraste.
%[text]     2\.2 Umbralice `Igris` utilizando `imbinarize`. Muestre la imagen binaria y su histograma. Pruebe con diferentes umbrales y observe la relación del valor del umbral con las imágenes resultantes.
%[text]     2\.3 Obtenga el negativo de `Igris`. Muestre conjuntamente la imagen original y el negativo, así como sus histogramas. Explique la relación entre ambos histogramas.
%%
%[text] 3\. Sobre la imagen "avion1.jpg":
%[text]     3\.1 Realice una corrección gamma. Pruebe con distintos valores de gamma (al menos un valor de gamma \< 1 y otro \> 1) y analice el efecto de cada uno sobre la imagen de salida.
%[text]     3\.2 Ecualice el histograma de la imagen utilizando `histeq` con 256, 64 y 8 niveles de salida. Muestre conjuntamente la imagen original y las tres imágenes obtenidas, junto con sus histogramas. Compare los resultados y explique cómo influye el número de niveles utilizado en la ecualización.
%%
%[text] 4\. Sobre la imagen "matricula.jpg":
%[text]     4\.1 Averigüe sus dimensiones (filas x columnas) en píxeles. Obtenga una nueva imagen con la mitad de filas y la mitad de columnas y verifique su tamaño. Visualice ambas figuras. Para poder ver el cambio de tamaño puede utilizar la instrucción *truesize* después de *imshow* para que las imágenes no ajusten su tamaño al de la ventana.
%[text]     4\.2 Rote la imagen un ángulo de 65,3º utilizando los métodos de interpolación `nearest` y `bicubic`. Muestre la imagen original y ambos resultados conjuntamente. Amplíe una zona con bordes o detalles finos para hacer visibles las diferencias entre los dos métodos y explíquelas.
%%
%[text] 5\. Ruido y filtrado
%[text] 5\.1. A partir de la imagen `cell.tif`, obtenga y muestre una versión con ruido gaussiano de media cero y varianza 0,01, que denominaremos `Ig`. Fíltrela utilizando un filtro de promedio del entorno de vecindad, primero con un entorno de 3x3 y después con uno de 5x5. Muestre conjuntamente la imagen original, la imagen ruidosa y las dos imágenes filtradas, utilizando `subplot` o `tiledlayout`/`nexttile`. Compare los resultados y justifique el efecto que tiene el tamaño del entorno sobre la reducción de ruido y la conservación de los detalles de la imagen.
%[text] 5\.2. Obtenga una versión de `cell.tif` con ruido de tipo sal y pimienta de densidad 5 %. Fíltrela utilizando un filtro de mediana y un filtro paso bajo de promedio del entorno de vecindad con entorno 3x3. Muestre conjuntamente la imagen original, la imagen ruidosa y las dos imágenes filtradas. Compare los resultados y responda: ¿qué tipo de filtrado resulta más adecuado para este tipo de ruido? Justifique sus conclusiones teniendo en cuenta tanto la eliminación del ruido como la conservación de bordes y detalles.
%[text]{"align":"center"} 5\.3. Obtenga y muestre una versión de `cell.tif` con ruido multiplicativo de tipo *speckle* con varianza 0.05. Fíltrela utilizando un filtro de Wiener y un filtro paso bajo de promedio  del entorno de vecindad con entorno 5x5. Muestre conjuntamente la imagen original, la imagen ruidosa y las dos imágenes filtradas. Compare los resultados y responda: ¿cuál de los dos filtros resulta más adecuado para este tipo de ruido? Justifique su respuesta teniendo en cuenta la reducción del ruido y la conservación de los detalles de la imagen.
%[text] 5\.4. Mediante un bucle `for`, obtenga 32 imágenes diferentes a partir de `cell.tif`, añadiendo a cada una ruido gaussiano independiente de media cero y varianza 0,05. Guarde las imágenes utilizando `imwrite` en ficheros con nombres consecutivos (`ruidosa1.bmp`, …, `ruidosa32.bmp`). Puede generar los nombres de los ficheros dentro del bucle *for* utilizando, por ejemplo: "ruidosa" + i + ".bmp".
%[text] A continuación, aplique la técnica de promediado de imágenes, utilizando primero 4 imágenes ruidosas, después 8, 16 y, finalmente, las 32 imágenes. Muestre conjuntamente la imagen original, una de las imágenes ruidosas y los resultados obtenidos al promediar 4, 8, 16 y 32 imágenes. Compare visualmente los resultados y explique cómo evoluciona el ruido de la imagen de salida al aumentar el número de imágenes promediadas. Preste especial atención al tipo de datos utilizado durante el cálculo del promedio, para evitar pérdidas de precisión o saturaciones.
%[text] 
%[text] 
%[text] 

%[appendix]{"version":"1.0"}
%---
%[metadata:view]
%   data: {"layout":"inline","rightPanelPercent":40}
%---

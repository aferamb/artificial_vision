%[text]{"align":"center"} # **Visión Artificial. GIEC-GITT.**
%[text]{"align":"center"} # **Sistemas de Visión Artificial. GII-GIC-GISI.**
%[text]{"align":"center"}  **Sira Palazuelos, Miguel Angel Garcia, Juan Manuel Miguel**
%[text]{"align":"center"}  **Departamento de Electrónica. Universidad de Alcalá.**
%[text] 
%[text] **Nombre:**
%[text] **Fecha:**
%[text]{"align":"center"} # 
%[text] # Tema 4. Ejercicio 5. Texturas
%[text] El objetivo de este ejercicio es la caracterización de texturas. Para ello, sobre imágenes con texturas diferentes, se obtendrán y compararán los valores de entropía, las matrices de coocurrencia en niveles de gris (GLCM) y diferentes estadísticas obtenidas a partir de las GLCM para diversos vectores de desplazamiento (*offset)*.
%[text] Paso 1) Lectura de las imágenes.
clear all
close all
% textures from http://www.cb.uu.se/~gustaf/texture/
imagenames = {'texture-stone.png','texture-sand.png','texture-linseeds.png', ...
              'texture-canvas.png','texture-pattern1.png','texture-pattern2.png'};

textureImg=[];
for n=1:length(imagenames)
    textureImg{n} = imread(imagenames{n});
end
%[text] Paso 2) **Entropía:** Calcule la entropía de las imágenes de patrones *textureImg* leídas en el paso anterior (usando la función **`entropy)`**, y ordénelas (usando la función **`sort)`**, en orden creciente de entropía (de la más baja a la más alta) y muestre las imágenes y su entropía según dicho orden. ¿Qué imagen tiene la menor entropía? Relacione el resultado con la distribución de sus niveles de gris y justifique sus conclusiones.


%[text] Paso 3) **GLCM (Matriz de coocurrencia de niveles de gris).** Lea la ayuda de la función **`graycomatrix`** para entender todos sus parámetros ([https://es.mathworks.com/help/images/ref/graycomatrix.html](https://es.mathworks.com/help/images/ref/graycomatrix.html)). Defina los vectores de desplazamiento (`offsets`) correspondientes a las direcciones 0°, 45°, 90° y 135°, utilizando `len=5`. Utilícelos para calcular el conjunto de matrices de coocurrencia (GLCMs), usando la función **`graycomatrix`** sobre los ficheros anteriores. Puede serle útil consultar el código del ejemplo "**Calcular GLCM utilizando cuatro desfases diferentes"** de la ayuda de la función **`graycomatrix`**. Compruebe en la ayuda qué número de niveles de gris utiliza `graycomatrix` por defecto y relacione este comportamiento con lo estudiado en teoría.
len = 5;
% [row_offset, col_offset]
offsets = [0 len;
    % completar
    ];

%co-ocurrence matrix
%[text] Paso 4) Visualice la primera GLCM, correspondiente al primer offset, utilizando colores escalados. Observe cómo se distribuyen sus valores y compárela con las GLCM correspondientes a otros vectores de desplazamiento. Para ello puede adaptar el código siguiente:
% imagesc(glcm(:,:,1))
% colormap jet
% colorbar
%[text] Paso 5) Obtenga y visualice los estadísticos  `Contrast, Correlation, Energy y Homogeneity` de las GLCM utilizando la función ***`graycoprops`*** para las imágenes **`'texture-linseeds.png'`** y **`'texture-pattern2.png'`** utilizando las GLCM correspondientes a los diferentes vectores de desplazamiento definidos anteriormente.
%[text] Compare los valores obtenidos para las dos texturas y para los diferentes offsets. ¿Qué propiedades cambian al modificar la dirección del desplazamiento? Relacione los resultados con las características visuales de las dos texturas.


%[appendix]{"version":"1.0"}
%---
%[metadata:view]
%   data: {"layout":"onright","rightPanelPercent":40}
%---

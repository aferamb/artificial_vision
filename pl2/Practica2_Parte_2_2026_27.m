%[text]{"align":"center"} # **Vision Artificial. GIEC.**
%[text]{"align":"center"} # **Sistemas de Vision Artificial. GIC.**
%[text]{"align":"center"} **Sira Palazuelos, Miguel Angel Garcia, Juan Manuel Miguel.** 
%[text]{"align":"center"}  **Departamento de Electrónica. Universidad de Alcalá. SPAIN.**
%[text] **Autor(es):**
%[text] 
%[text] **Fecha:**
%[text] 
%[text] # Tema 2. Corrección de transformaciones geométricas. 
%[text] Para corregir el efecto de las transformaciones geométricas debemos calcular la matriz que nos permite cambiar la posición de los píxeles de entrada y ubicarlos en las posiciones de salida correctas/no distorsionadas. En Matlab la función que utilizamos para ello es [`tform = estgeotform2d(matchedPoints1,matchedPoints2,transformType)`](https://www.mathworks.com/help/releases/R2023a/vision/ref/estgeotform2d.html?browser=F1help#d124e211773?browser=F1help)`,` que estima la matriz necesaria para hacer coincidir los `matchedPoints1` de la imagen de entrada con los `matchedPoints2` de la imagen de salida. En este ejercicio, le proporcionaremos nosotros como variable los valores de `matchedPoints2` donde deben ubicarse los píxeles de la imagen de salida después de la transformación. 
%[text] # Corrección de giro (con o sin traslación o escalado)
%[text] Para calcular la matriz necesaria para corregir una imagen rotada (con o sin traslación o escalado) solamente necesitamos 2 puntos. En este caso seleccionaremos los dos puntos más alejados de los anillos de saturno y el código está preparado para girarlos y colocarlos en horizontal.
clc
clear all;
close all;

% Read original image.
I = imread('saturn.tif');

% Seleccionar dos puntos de los anillos.
% impixel devuelve sus coordenadas x e y.

figure
[x, y, P] = impixel(I)
srcPoints = [x y]
dstPoints = [100 100; ...
            300 100]; % Posición de los extremos de los anillos para que queden en posición horizontal
[tform,inlierIndex,status] = estgeotform2d(srcPoints, dstPoints,'similarity')  
destino = imwarp(I,tform);   % Realiza el inverse warping
figure; imshow(destino);
%%
%[text] Modifique los valores de los puntos de destino para que la imagen final quede con orientación distinta y muéstrela.
dstPoints = [];

%%
%[text] # Corrección de la Perspectiva con Homografía
Para corregir la perspectiva de un objeto es necesario estimar la transformación de la perspectiva. Cuatro pares de puntos correspondientes son suficientes para recuperar una transformación de perspectiva entre dos imágenes. El objetivo de esta práctica es corregir la perspectiva de la carta de la imagen "card.jpg",
%[text] Se pide: 
%[text] 1. Cargue la imagen "**`card.jpg`**". Haga clic en las cuatro esquinas de la tarjeta para obtener los primeros cuatro puntos utilizando la función **`impixel`**. Nota: utilice el siguiente orden para obtener los cuatro puntos: 1) Esquina superior izquierda, 2) Esquina superior derecha, 3) Esquina inferior derecha, 4) Esquina inferior izquierda.
%[text] 2. Calcule los cuatro puntos de la carta de póquer sin distorsión de perspectiva, teniendo en cuenta que una carta de póquer tiene un tamaño de 100 `mm` por `150 mm` aproximadamente.
%[text] 3. Estime la transformación de la perspectiva utilizando la función **`estgeotform2d`** sabiendo que en este caso el tipo de transformación es `"`**`projective`**`".` 
%[text] 4. Aplicar la transformación de perspectiva utilizando la función **`imwarp`**.
%[text] 5. Muestre la carta no distorsionada. \


%[appendix]{"version":"1.0"}
%---
%[metadata:view]
%   data: {"layout":"inline","rightPanelPercent":36.6}
%---

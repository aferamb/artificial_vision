%[text]{"align":"center"} # **Visión Artificial. GIEC-GITT.**
%[text]{"align":"center"} # **Sistemas de Visión Artificial. GII-GIC-GISI.**
%[text]{"align":"center"}  **Sira Palazuelos, Miguel Angel Garcia, Juan Manuel Miguel**
%[text]{"align":"center"}  **Departamento de Electrónica. Universidad de Alcalá.**
%[text] 
%[text] **Nombre:**
%[text] **Fecha:**
%[text]{"align":"center"} # 
%[text] # Tema 4. Ejercicio 3. *Local Features*
%[text] El objetivo de esta práctica es mostrar el potencial de las denominadas "*Local Features*". Para ello se va a buscar un objeto dentro de una escena utilizando los detectores y descriptores de características locales.
clear all
close all
%[text] Step 1) Leer la imagen de referencia que contiene el objeto de interés.
Object1Image = imread('elephant.jpg');
 
figure;
imshow(Object1Image);
title('Image of an Object1');
%[text] Se lee la escena que contiene al objeto de interés.
sceneImage = imread('clutteredDesk.jpg');
figure; 
imshow(sceneImage);
title('Image of a Cluttered Scene');
%[text]  Step 2) Se detectan las características locales del objeto y de la escena:
% Detect feature points in both images.
Object1Points = detectSURFFeatures(Object1Image);
scenePoints = detectSURFFeatures(sceneImage);
%[text] Se visualizan los puntos más fuertes que se encuentran en la imagen del objeto de referencia:
figure; 
imshow(Object1Image);
title('100 Strongest Feature Points from Object1 Image');
hold on;
plot(selectStrongest(Object1Points, 100));
%[text] Se visualizan los puntos más fuertes que se encuentran en la imagen de la escena
figure; 
imshow(sceneImage);
title('300 Strongest Feature Points from Scene Image');
hold on;
plot(selectStrongest(scenePoints, 300));
%[text] Step 3) Se extraen los descriptores de caracterísitcas de ambas imágenes.
[Object1Features, Object1Points] = extractFeatures(Object1Image, Object1Points);
[sceneFeatures, scenePoints] = extractFeatures(sceneImage, scenePoints);
%[text] Step 4) Se encuentran las coincidencias (*matches*) y se visualizan.
Object1Pairs = matchFeatures(Object1Features, sceneFeatures, 'MaxRatio', 0.9);
numMatches = size(Object1Pairs,1)
matchedObject1Points = Object1Points(Object1Pairs(:, 1), :);
matchedScenePoints = scenePoints(Object1Pairs(:, 2), :);
figure;
showMatchedFeatures(Object1Image, sceneImage, matchedObject1Points, ...
    matchedScenePoints, 'montage');
title('Putatively Matched Points (Including Outliers)');
%[text] Step 5) Se localiza el objeto en la escena usando las coincidencias. 
%[text] **`estimateGeometricTransform`** calcula la transformación relacionando los puntos coincidentes, a la vez que elimina los valores outliers. Esta transformación nos permite localizar el objeto en la escena.
[tform, inlierObject1Points, inlierScenePoints] = estimateGeometricTransform(matchedObject1Points, matchedScenePoints, 'affine');
numInliers = inlierObject1Points.Count
figure;
showMatchedFeatures(Object1Image, sceneImage, inlierObject1Points, inlierScenePoints, 'montage');
title('Matched Points (Inliers Only)');
%[text] Se obtiene el polígono delimitador de la imagen de referencia.
Object1Polygon = [1, 1;...                           % top-left
        size(Object1Image, 2), 1;...                 % top-right
        size(Object1Image, 2), size(Object1Image, 1);... % bottom-right
        1, size(Object1Image, 1);...                 % bottom-left
        1, 1];                   % top-left again to close the polygon 
%[text] Se transforma el polígono en el sistema de coordenadas de la imagen de destino. El polígono transformado indica la ubicación del objeto1 en la escena.
newObject1Polygon = transformPointsForward(tform, Object1Polygon);    

figure;
imshow(sceneImage);
hold on;
line(newObject1Polygon(:, 1), newObject1Polygon(:, 2), 'Color', 'y');
title('Detected Object1');
%%
%[text] Se pide:
%[text] 1. Repita el proceso anterior pero buscando otro objeto de la escena, en este caso la caja de la grapadora, cuya imagen es **`'stapleRemover.jpg'`**. Además utilice el detector y descriptor BRISK ([`detectBRISKFeatures`](https://es.mathworks.com/help/vision/ref/detectbriskfeatures.html)). Compruebe cuántos pares de puntos empareja el algoritmo visualizando la salida de la función **matchFeatures**.
%[text] 2. Añada ruido gaussiano de varianza `0.001` a la imagen `'clutteredDesk.jpg'` y repita el apartado anterior. Compare el número de emparejamientos y de `inliers` con los obtenidos sin ruido. ¿Sigue siendo posible localizar correctamente el objeto?
%[text] 3. Repita el apartado anterior utilizando ruido gaussiano de varianza `0.01`. Compare nuevamente el número de emparejamientos y de `inliers`. ¿Es posible localizar el objeto?
%[text] 4. Aplique a la imagen ruidosa alguna técnica de reducción de ruido estudiada previamente y repita el proceso. ¿Mejora el resultado? Justifique la respuesta a partir del número de correspondencias obtenidas y de la localización final del objeto. \

%[appendix]{"version":"1.0"}
%---
%[metadata:view]
%   data: {"layout":"inline","rightPanelPercent":40}
%---

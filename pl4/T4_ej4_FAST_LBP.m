%[text]{"align":"center"} # **Visión Artificial. GIEC-GITT.**
%[text]{"align":"center"} # **Sistemas de Visión Artificial. GII-GIC-GISI.**
%[text]{"align":"center"}  **Sira Palazuelos, Miguel Angel Garcia, Juan Manuel Miguel**
%[text]{"align":"center"}  **Departamento de Electrónica. Universidad de Alcalá.**
%[text] 
%[text] **Nombre:**
%[text] **Fecha:**
%[text]{"align":"center"} # 
%[text] # Tema 4. Ejercicio 4. Características locales y texturas
%[text] ## Localización de esquinas utilizando el algoritmo FAST
%[text] El objetivo de esta práctica es comprobar el comportamiento del detector FAST para localizar esquinas en diferentes tipos de imágenes. Para ello:
%[text] - Utilice `corners = detectFASTFeatures(I)` sobre la imagen 'ladrillos1.jpg', y visualice las esquinas sobre ella con la instrucción  \
%[text] **strongestCorners = corners.selectStrongest(25);**
%[text] **plot(strongestCorners.Location(:,1), strongestCorners.Location(:,2), 'ro', 'MarkerSize', 10, 'LineWidth', 1.5)**;
%[text] - Aumente el número de esquinas seleccionadas y visualizadas para comprobar que las que se incorporan tienen una respuesta menor que las iniciales.
%[text] - Pruebe sobre diferentes imágenes (texture-pattern2.png, rice.tif, etc.) para identificar aquellas en las que estas características pueden resultar más útiles. \

%%
%[text] ## Uso de características LBP para distinguir imágenes con texturas diferentes
%[text] El objetivo de este ejercicio es verificar el comportamiento de las caracteristicas LBP en imágenes con texturas diferentes. Para ello:
%[text] - Abra y muestre las imágenes texture-canvas.png, gotas.jpg, ladrillos2.jpg, ladrillos3.jpg y ladrillos4.jpg y calcule sus características LBP con la instrucción `LBPImag1 = extractLBPFeatures(Imag1,'Upright',false).`Utilice `'Upright',false` para obtener la variante invariante a rotación de LBP estudiada en teoría.
%[text] - Visualice las características con `bar(LBPImag1)`. ¿Se parecen entre sí las características de las distintas imágenes? Utilice la función subplot para visualizar todas las imágenes y características y así poder realizar la comparación fácilmente.
%[text] - Calcule la distancia entre las características LBP de ladrillos3.jpg y cada una de las demás imágenes, utilizando la instrucción `DistImag1_2 = norm (LBPImag1 - LBPImag2)`. Compare las distancias obtenidas. ¿Son coherentes con la similitud que se aprecia visualmente entre las texturas? Justifique la respuesta. \


%[appendix]{"version":"1.0"}
%---
%[metadata:view]
%   data: {"layout":"inline","rightPanelPercent":40}
%---

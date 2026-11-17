%[text]{"align":"center"} # **Visión Artificial. GIEC-GITT.**
%[text]{"align":"center"} # **Sistemas de Visión Artificial. GII-GIC-GISI.**
%[text]{"align":"center"}  **Sira Palazuelos, Miguel Angel Garcia, Juan Manuel Miguel**
%[text]{"align":"center"}  **Departamento de Electrónica. Universidad de Alcalá.**
%[text] 
%[text] **Nombre:**
%[text] **Fecha:**
%[text]{"align":"center"} # 
%[text] # Tema 4. Ejercicio 1.1. Identificación de círculos
%[text] 1\) Lee la imagen
RGB = imread('pillsetc.png');
imshow(RGB);
%[text] 2\) Umbraliza la imagen
I = rgb2gray(RGB);
bw = imbinarize(I);
imshow(bw)
%[text] 3\) Elimina el ruido
%[text] Usando operaciones morfológicas se eliminan los píxeles que no pertenecen a los objetos de interés.
% remove all object containing fewer than 30 pixels
bw = bwareaopen(bw,30);

% fill a gap in the pen's cap
se = strel('disk',2);
bw = imclose(bw,se);

% fill any holes, so that regionprops can be used to estimate
% the area enclosed by each of the boundaries
bw = imfill(bw,'holes');

imshow(bw)
%[text] 4\) Encuentra los contornos
%[text] Nos centramos sólo en los límites exteriores. La opción `'noholes'` acelerará el proceso al evitar que la función **`bwboundaries`** busque contornos internos. 
[B,L,n] = bwboundaries(bw,'noholes'); % Obtiene los contornos exteriores de los objetos y la matriz de etiquetas.

% Display the label matrix 
imshow(label2rgb(L, @jet, [.5 .5 .5]))

hold on  % to draw the next in the same figure

% draws the boundaries of each object.
for k = 1:n
  boundary = B{k};
  plot(boundary(:,2), boundary(:,1), 'w', 'LineWidth', 2)
end
%%
%[text] Se pide:
%[text] 1. Utilice la ayuda de Matlab para conseguir información sobre la función **`regionprops`** (parámetros requeridos, propiedades que calcula, etc.).
%[text] 2. Usando dicha función, calcule el área y el perímetro de cada objeto de la imagen previa. 
%[text] 3. A partir del área y el perímetro de cada objeto devueltos por `regionprops`, calcule su circularidad mediante la expresión F=4\*pi\*A/(p^2) estudiada en teoría. 
%[text] 4. Umbralice el valor de la circularidad y resalte los objetos que sean aproximadamente circulares (p.ej., pintando las boundaries de color diferente). 
%[text] 5. Utilice un slider para comprobar cómo influye el valor del umbral en los objetos seleccionados.  \
%%
%[text] # Tema 4. Ejercicio 1.2. Identificación de objetos cóncavos/convexos
%[text] 
%[text] 1. Cargue la imagen **`'Figure1.jpg'`** 
%[text] 2. Utilice la función **`regionprops`** para calcular el área, el área convexa y el índice de convexidad (Solidity). Visualice una tabla con las tres propiedades para todos los objetos de la imagen.
%[text] 3. Resalte la envolvente convexa ('ConvexHull') de cada objeto: en blanco para los objetos cóncavos y en magenta para los convexos, utilizando el valor de `Solidity` para diferenciarlos.
%[text] 4. Utilice un slider para umbralizar el índice de convexidad dentro del rango de valores obtenido (según aparecen en la tabla del punto 2) y compruebe qué objetos son seleccionados al variar el valor del umbral. Justifique si la selección es correcta según los valores obtenidos.  \

%[appendix]{"version":"1.0"}
%---
%[metadata:view]
%   data: {"layout":"onright","rightPanelPercent":40}
%---

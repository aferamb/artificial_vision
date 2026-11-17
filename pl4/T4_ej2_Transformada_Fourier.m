%[text]{"align":"center"} # **Visión Artificial. GIEC-GITT.**
%[text]{"align":"center"} # **Sistemas de Visión Artificial. GII-GIC-GISI.**
%[text]{"align":"center"}  **Sira Palazuelos, Miguel Angel Garcia, Juan Manuel Miguel**
%[text]{"align":"center"}  **Departamento de Electrónica. Universidad de Alcalá.**
%[text] 
%[text] **Nombre:**
%[text] **Fecha:**
%[text]{"align":"center"} # 
%[text] # Tema 4. Ejercicio 2. Transformada de Fourier
%[text] El objetivo de la práctica es calcular la transformada de Fourier de los contornos exteriores de los objetos de una imagen y reconstruirlos utilizando únicamente una parte de sus componentes de baja frecuencia, analizando cómo influye el número de componentes utilizadas en la aproximación obtenida.
%[text] Las funciones proporcionadas centran internamente la transformada, de forma que al reducir el número de componentes se conservan las componentes de baja frecuencia y se eliminan progresivamente las de mayor frecuencia.
%[text] Step 1) Read Image
    close all
    clear all

    imgOriginal = imread('google.jpg');
    figure;
    imshow(imgOriginal);
    title('Original image');
%[text] Step 2) Threshold the Image
    if size(imgOriginal,3) == 3
        imgOriginal = rgb2gray(imgOriginal); 
    end
    imgBW = imbinarize(imgOriginal);
    imgBW = imcomplement(imgBW);
    
    figure;
    imshow(imgBW);
    title('binarized image');
%[text] Step 3) Find the external Boundaries
    [B,L] = bwboundaries(imgBW,'noholes');
    figure
    imshow(label2rgb(L, @jet, [1.0 1.0 1.0]))
    hold on
    for k = 1:length(B)
       boundary = B{k};
       plot(boundary(:,2), boundary(:,1), 'g', 'LineWidth', 4);
    end  
%[text] Step 4)  Fourier transform 
     
    for k = 1:length(B)
       boundary = B{k};
       % fourier_transform()    %  a partir de las boundaries
                                % proporciona la transformada de Fourier
                                % (listado de números complejos)
       
       % fourier_inv_transform()   %  a partir de un número determinado de componentes de
                                   % la transformada de Fourier recupera las boundaries aproximadas
       
       % plot recovered boundary
       
    end   
%%
%[text] Se pide: 
%[text] 1. Complete el paso 4, utilizando la función **`fourier_transform(),`** proporcionada con este enunciado, para obtener la transformada de Fourier del contorno de cada uno de los objetos etiquetados.
%[text] 2. Obtenga los contornos reconstruidos de los objetos etiquetados realizando la transformada inversa de Fourier con la función **fourier\_inv\_transform()**, también incluida con el enunciado. Consulte los comentarios de la función para realizar la reconstrucción utilizando aproximadamente el **10 %** del total de componentes. Dibuje cada contorno reconstruido sobre la figura original utilizando `hold on` y compruebe visualmente cómo se ajusta al contorno original.
%[text] 3. Repita el proceso reduciendo el número de componentes utilizados para la reconstrucción al 5\*\*% **del total**.\*\*
%[text] 4. Repita el proceso reduciendo el número de componentes utilizados para la reconstrucción al 2\*\*%\*\* del total
%[text] 5. Compare los resultados obtenidos con los tres porcentajes. Explique qué ocurre al reducir el número de componentes y relacione el resultado con la información representada por las componentes de baja y alta frecuencia.  \
%[text] 

%[appendix]{"version":"1.0"}
%---
%[metadata:view]
%   data: {"layout":"inline","rightPanelPercent":40}
%---

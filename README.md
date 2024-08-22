# Código y Comentarios de Procesamiento de Imágenes

```python
# Clase 3: Imágenes y Representación Digital

# Trabajamos con imágenes en 8 bits, donde los píxeles tienen valores de 0 a 255. 
# Nota: OpenCV carga imágenes en BGR, por lo que es necesario convertirlas a RGB.

import cv2
# Leer la imagen
A = cv2.imread('img.jpeg')
# Convertir el formato de BGR a RGB
A = cv2.cvtColor(A, cv2.COLOR_BGR2RGB)
  
   
% Operaciones Básicas con Imágenes en   

% Cargar y Mostrar Imágenes

% Cargar la imagen
A = imread('img.jpg');
% Mostrar la imagen
imshow(A);
% Colocar un título
title('Mi imagen');
  
   
% Guardar Imágenes en Diferentes Formatos

% Guardar imagen en otro formato
imwrite(A, 'imgBMP.bmp');
  
   
% Manipulación de Imágenes: Suma y Resta

% Aclarar la imagen sumando un valor a cada píxel
B = A + 20;
imshow(B);

% Oscurecer la imagen restando un valor a cada píxel
B = A - 20;
imshow(B);
  
   
% Clase 4: Ruido y Filtros

% Introducción de Ruido

pkg load image

% Cargar la imagen
A = imread('img1.jpg');
subplot(1,3,1)
imshow(A)
title('Imagen original')

% Añadir ruido sal y pimienta
Y = imnoise(A, 'salt & pepper', 0.05);
subplot(1,3,2)
imshow(Y)
title('Imagen con ruido sal y pimienta')

% Eliminar el ruido usando filtro de mediana
Z = medfil2(Y);
subplot(1,3,3)
imshow(Z)
title('Imagen limpiada')
  
   
% Otras Operaciones

% Conversión a Escala de Grises

% Convertir imagen RGB a escala de grises
B = rgb2gray(A);
subplot(1,2,2)
imshow(B)
title('Imagen en escala de grises')
  
   
% Ajuste de Contraste

% Ajustar el contraste de la imagen
B = imadjust(A);
subplot(1,2,2)
imshow(B)
title('Imagen con contraste mejorado')
  
   
% Redimensionado

% Redimensionar la imagen
B = imresize(A, [256, 256]);
subplot(1,2,2)
imshow(B)
title('Imagen redimensionada')
  
   
% Rotación

% Rotar la imagen 45 grados
B = imrotate(A, 45);
subplot(1,2,2)
imshow(B)
title('Imagen rotada')
  
   
% Detección de Bordes

% Detectar bordes usando el método Canny
B = edge(A, 'Canny');
subplot(1,2,2)
imshow(B)
title('Imagen con bordes resaltados')
  
   
% Segmentación de Imágenes

% Segmentar la imagen en diferentes tonalidades
B = graythresh(A);
C = im2bw(A,B);
subplot(1,2,2)
imshow(C)
title('Imagen segmentada')
  
   
% Clase 5: Transformaciones Geométricas

% Traslación
% Mover la imagen en los ejes x e y.

pkg load image

% Cargar la imagen
A = imread('img.jpg');
A = imresize(A, [128, 128]); % Redimensionar para una animación más rápida
subplot(1,2,1)
imshow(A)
title('Imagen original')

[m,n,r] = size(A);
% Aplicar traslación a la imagen
for i=1:min([m n])
  B = uint8(zeros(m,n,r)); % Inicializar nueva imagen
  deltax = i; deltay = i;
  for x=1:m
    for y=1:n
      x_t = x + deltax;
      y_t = y + deltay;
      if and(x_t<=m, y_t<=n)
        B(x_t,y_t,:) = A(x,y,:);
      end
    end
  end
  subplot(1,2,2)
  imshow(B)
  title('Imagen trasladada')
  pause(0.1)
end
  
   
% Rotación
% Rotar la imagen en un ángulo específico.

pkg load image

% Cargar la imagen
A = imread('img.jpg');
A = imresize(A, [128, 128]); % Redimensionar para una animación más rápida
subplot(1,2,1)
imshow(A)
title('Imagen original')

[m,n,r] = size(A);
% Rotar la imagen 45 grados
B = uint8(zeros(m,n,r));
angulo = 45;
a0 = cosd(angulo); a1 = sind(angulo);
b0 = -sind(angulo); b1 = cosd(angulo);
xc = floor(m/2); yc = floor(n/2);
for x=1:m
  for y=1:n
    x_aux = round(a0*(x-xc) + a1*(y-yc) + xc);
    y_aux = round(b0*(x-xc) + b1*(y-yc) + yc);
    if and(x_aux>0 && x_aux<=m, y_aux>0 && y_aux<=n)
      B(x_aux,y_aux,:) = A(x,y,:);
    end
  end
end
subplot(1,2,2)
imshow(B)
title('Imagen rotada')
  
   
% Clase 6: Transformaciones Afines

% Escalamiento
% Aumentar o disminuir el tamaño de la imagen.

% Efecto Rippling
% Crear un efecto ondulado en la imagen.

pkg load image

% Cargar la imagen
A = imread('img.jpg');
A = imresize(A, [128,128]); % Redimensionar para un procesamiento más rápido
subplot(1,2,1)
imshow(A)
title('Imagen original')

[m,n,r] = size(A);

% Aplicar efecto rippling
Lx = 75; Ly = 75;
for k = 5:5:200
  Ax = k; Ay = k;
  B = uint8(zeros(m,n,r));
  for x=1:m
    for y=1:n
      xaux = round(x + Ax*sin(2*pi*y/Lx));
      yaux = round(y + Ay*sin(2*pi*x/Ly));
      xnew = mod(xaux,m); ynew = mod(yaux,n);
      if and(xnew>0 && xnew<=m, ynew>0 && ynew<=n)
        B(xnew,ynew,:) = A(x,y,:);
      end
    end
  end
  subplot(1,2,2)
  imshow(B)
  title('Imagen con efecto rippling')
  pause(0.05)
end
  
   
% Clase 7: Histogramas

% Cálculo del Histograma

pkg load image

% Cargar la imagen
A = imread('img.jpg');
subplot(2,2,1)
imshow(A);
title('Imagen original')

% Calcular el histograma de la imagen
h1 = zeros(256,1);
[m,n] = size(A);
for x=1:m
  for y=1:n
    h1(A(x,y)+1) = h1(A(x,y)+1)+1;
  end
end
subplot(2,2,2)
bar(0:255,h1)
title('Histograma')
xlim([0 255])
  
   
% Modificación Mediante Histogramas

% Ecualización
% Distribuye uniformemente los niveles de gris.

pkg load image

% Cargar la imagen
A = imread('img.jpg');
subplot(2,2,1)
imshow(A);
title('Imagen original')

% Calcular el histograma
h = zeros(256,1);
[m,n] = size(A);
for i=0:255
  h(i+1) = sum(sum(A==i));
end
subplot(2,2,2)
bar(0:255,h)
title('Histograma')
xlim([0 255])

% Distribución acumulada
ac = zeros(256,1);
for i=0:255
  ac(i+1) = sum(h(1:i+1))/(m*n);
end

% Obtener la nueva imagen aplicando ecualización
B = zeros(m,n);
A = double(A);
for x=1:m
  for y=1:n
    B(x,y) = round(ac(A(x,y)+1)*255);
  end
end
B = uint8(B);
subplot(2,2,3)
imshow(B)
title('Imagen ecualizada')

% Calcular el histograma de la imagen ecualizada
h2 = zeros(256,1);
for i=0:255
  h2(i+1) = sum(sum(B==i));
end
subplot(2,2,4)
bar(0:255,h2)
title('Histograma de la imagen ecualizada')
xlim([0 255])
  
   
% Estiramiento
% Expande el rango de intensidades.

pkg load image

% Cargar la imagen
A = imread('img.jpg');
subplot(2,2,1)
imshow(A)
title('Imagen original')

subplot(2,2,2)
imhist(A)
title('Histograma de la imagen original')

A = double(A);
r_min = min(min(A)); r_max = max(max(A));

% Operación de estiramiento
B = floor(255/(r_max-r_min))*(A-r_min);
B = uint8(B);

subplot(2,2,3)
imshow(B)
title('Imagen estirada')

subplot(2,2,4)
imhist(B)
title('Histograma de la imagen estirada')
  
   
% Reducción
% Comprime la escala de grises.

pkg load image

% Cargar la imagen
A = imread('img.jpg');
subplot(2,2,1)
imshow(A)
title('Imagen original')

subplot(2,2,2)
imhist(A)
title('Histograma de la imagen original')

A = double(A);
r_min = min(min(A)); r_max = max(max(A));
s_min = r_min + 70; % s_min debe ser mayor que r_min
s_max = r_max - 70; % s_max debe ser menor que r_max

% Operación de reducción
B = ((s_max-s_min)/(r_max-r_min))*(A-r_min)+s_min;
B = uint8(B);

subplot(2,2,3)
imshow(B)
title('Imagen reducida')

subplot(2,2,4)
imhist(B)
title('Histograma de la imagen reducida')

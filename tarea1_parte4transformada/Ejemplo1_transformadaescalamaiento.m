
pkg load image;

% Cargar la imagen original
I = imread('barbara.jpg');

% Obtener el tamaño de la imagen original
[m, n, r] = size(I);

% Definir los factores de escalamiento
sx = 0.5;
sy = 1.5;

% Definir la matriz de transformación afín para escalamiento
A = [sx 0 0;
     0 sy 0;
     0 0  1];

% Definir la transformada utilizando la función `maketform`
T = maketform('affine', A);

% Realizar la transformación afín con el comando `imtransform`
% Manteniendo la calidad original y el tamaño
It = imtransform(I, T, 'XData', [1 n], 'YData', [1 m], 'Size', [m n], 'FillValues', 0);

% Mostrar la imagen original y la imagen escalada
subplot(1,2,1);
imshow(I);
title('Imagen Original');

subplot(1,2,2);
imshow(It);
title('Imagen Escalada Manteniendo Calidad y Tamaño');


pkg load image


A=imread('barbara.jpg'); %Formato de 8 bits

% Obtener las dimensiones de la imagen
[m, n, ~] = size(A);

% Calcular la longitud diagonal de la imagen (nuevo tamaño del lienzo)
m_prime = floor(sqrt(m^2 + n^2)) + 1;
n_prime = m_prime;

% Crear un nuevo lienzo de ceros (fondo negro)
padded_A = zeros(m_prime, n_prime, size(A, 3), 'like', A);

% Calcular la posición para colocar la imagen original en el centro del lienzo acolchado
x_offset = floor((m_prime - m) / 2);
y_offset = floor((n_prime - n) / 2);

% Colocar la imagen en el centro del lienzo acolchado
padded_A(x_offset + (1:m), y_offset + (1:n), :) = A;

% Definir el ángulo de rotación
theta = 45; % Ejemplo: rotación de 45 grados

% Rotar la imagen acolchada
rotated_A = imrotate(padded_A, theta, 'bilinear', 'crop');

% Mostrar la imagen final rotada
imshow(rotated_A);
title('Imagen Rotada con modificaciones');

% Guardar la imagen rotada (opcional)
imwrite(rotated_A, 'imagen_rotada_con_modificaciones.jpg');


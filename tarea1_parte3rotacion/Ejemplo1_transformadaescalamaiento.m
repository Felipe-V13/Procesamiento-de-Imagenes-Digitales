% Cargar la imagen
img = imread('barbara.jpg');

% Obtener el tamaño de la imagen original
[rows, cols, channels] = size(img);

% Definir los factores de escalamiento
sx = 0.5;
sy = 1.5;

% Crear la matriz de transformación afín para escalamiento
T = [sx 0 0; 0 sy 0; 0 0 1];

% Crear una imagen de salida vacía con el mismo tamaño que la original
scaled_img = zeros(rows, cols, channels, 'uint8');

% Invertir la matriz de transformación para mapear los píxeles
T_inv = inv(T);

% Aplicar la transformación a cada píxel
for i = 1:rows
    for j = 1:cols
        % Aplicar la transformación inversa
        new_coords = T_inv * [i; j; 1];
        x = round(new_coords(1));
        y = round(new_coords(2));

        % Verificar si las coordenadas transformadas están dentro de los límites
        if x > 0 && x <= rows && y > 0 && y <= cols
            scaled_img(i, j, :) = img(x, y, :);
        end
    end
end

% Mostrar la imagen resultante
imshow(scaled_img);


clc; clear; close all;

% Definir una matriz de 8x8 (puede ser parte de una imagen o una submatriz de la misma)
bloque = [
    52, 55, 61, 66, 70, 61, 64, 73;
    63, 59, 55, 90, 109, 85, 69, 72;
    62, 59, 68, 113, 144, 104, 66, 73;
    63, 58, 71, 122, 154, 106, 70, 69;
    67, 61, 68, 104, 126, 88, 68, 70;
    79, 65, 60, 70, 77, 68, 58, 75;
    85, 71, 64, 59, 55, 61, 65, 83;
    87, 79, 69, 68, 65, 76, 78, 94
];

% Función para calcular la DCT en una dimensión
function y = dct1d(x)
    n = length(x);
    y = zeros(1, n);
    for k = 0:n-1
        suma = 0;
        for i = 0:n-1
            suma += x(i+1) * cos(pi * k * (2*i + 1) / (2*n));
        end
        if k == 0
            y(k+1) = suma * sqrt(1/n);
        else
            y(k+1) = suma * sqrt(2/n);
        end
    end
end

% Función para calcular la DCT en dos dimensiones
function Y = dct2d(X)
    % Aplicar DCT a cada fila
    temp = zeros(size(X));
    for i = 1:size(X, 1)
        temp(i, :) = dct1d(X(i, :));
    end

    % Aplicar DCT a cada columna
    Y = zeros(size(X));
    for j = 1:size(X, 2)
        Y(:, j) = dct1d(temp(:, j)')';
    end
end

% Calcular la DCT del bloque de 8x8
dct_bloque = dct2d(bloque);

% Mostrar la matriz transformada
disp("Matriz DCT:");
disp(dct_bloque);

% Definir una matriz de cuantización estándar (puedes ajustarla para más o menos c


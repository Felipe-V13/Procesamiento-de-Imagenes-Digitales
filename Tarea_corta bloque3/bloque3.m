clc; clear; close all;
%Ejercicio 6 - Compresión usando la Transformada Discreta del Coseno (DCT)

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

% Definir la matriz de cuantización estándar
matriz_cuantizacion = [
    16, 11, 10, 16, 24, 40, 51, 61;
    12, 12, 14, 19, 26, 58, 60, 55;
    14, 13, 16, 24, 40, 57, 69, 56;
    14, 17, 22, 29, 51, 87, 80, 62;
    18, 22, 37, 56, 68, 109, 103, 77;
    24, 35, 55, 64, 81, 104, 113, 92;
    49, 64, 78, 87, 103, 121, 120, 101;
    72, 92, 95, 98, 112, 100, 103, 99
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

% Cuantización de la matriz DCT
bloque_cuantizado = round(dct_bloque ./ matriz_cuantizacion);

% Mostrar la matriz cuantizada
disp("Matriz DCT Cuantizada:");
disp(bloque_cuantizado);

% Descuantización de la matriz DCT (para reconstrucción)
bloque_reconstruido = bloque_cuantizado .* matriz_cuantizacion;

% Mostrar la matriz reconstruida (antes de aplicar la DCT inversa)
disp("Matriz reconstruida después de descuantización:");
disp(bloque_reconstruido);

% Función para calcular la IDCT en una dimensión
function y = idct1d(x)
    n = length(x);
    y = zeros(1, n);
    for i = 0:n-1
        suma = x(1) * sqrt(1/n);
        for k = 1:n-1
            suma += x(k+1) * cos(pi * k * (2*i + 1) / (2*n)) * sqrt(2/n);
        end
        y(i+1) = suma;
    end
end

% Función para calcular la IDCT en dos dimensiones
function Y = idct2d(X)
    % Aplicar IDCT a cada columna
    temp = zeros(size(X));
    for j = 1:size(X, 2)
        temp(:, j) = idct1d(X(:, j)')';
    end

    % Aplicar IDCT a cada fila
    Y = zeros(size(X));
    for i = 1:size(X, 1)
        Y(i, :) = idct1d(temp(i, :));
    end
end

% Calcular la IDCT del bloque cuantizado para reconstruir
bloque_reconstruido_final = idct2d(bloque_reconstruido);

% Mostrar la matriz reconstruida final
disp("Matriz reconstruida final después de IDCT:");
disp(round(bloque_reconstruido_final));


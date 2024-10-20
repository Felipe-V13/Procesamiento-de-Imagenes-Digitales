function bloque31()
    clc; clear; close all;

    % Definir la matriz A de 8x8
    A = [
        1, 9, 17, 25, 33, 41, 49, 57;
        2, 10, 18, 26, 34, 42, 50, 58;
        3, 11, 19, 27, 35, 43, 51, 0;
        4, 12, 20, 28, 36, 44, 0, 0;
        5, 13, 21, 29, 37, 0, 0, 0;
        6, 14, 22, 30, 0, 0, 0, 0;
        7, 15, 23, 0, 0, 0, 0, 0;
        8, 16, 0, 0, 0, 0, 0, 0
    ];

    % Convertir la matriz en un vector usando zig-zag
    x = mat2vect_diag(A);
    disp('Vector zig-zag:');
    disp(x);

    % Reconstruir la matriz desde el vector zig-zag
    C = vect2mat_diag(x);
    disp('Matriz reconstruida:');
    disp(C);

    % Función para convertir matriz 8x8 a vector usando zig-zag
    function x = mat2vect_diag(A)
        % Inicializar el vector de salida
        x = zeros(1, 64);
        index = 1;

        % Recorrer la matriz en zig-zag
        for sum = 1:(2*8 - 1)
            if mod(sum, 2) == 0
                % Diagonal descendente
                for row = max(1, sum-8+1):min(8, sum)
                    col = sum - row + 1;
                    x(index) = A(row, col);
                    index = index + 1;
                end
            else
                % Diagonal ascendente
                for col = max(1, sum-8+1):min(8, sum)
                    row = sum - col + 1;
                    x(index) = A(row, col);
                    index = index + 1;
                end
            end
        end
    end

    % Función para convertir vector a matriz 8x8 usando zig-zag
    function C = vect2mat_diag(x)
        % Inicializar la matriz de salida de 8x8
        C = zeros(8, 8);
        index = 1;

        % Rellenar la matriz en zig-zag
        for sum = 1:(2*8 - 1)
            if mod(sum, 2) == 0
                % Diagonal descendente
                for row = max(1, sum-8+1):min(8, sum)
                    col = sum - row + 1;
                    C(row, col) = x(index);
                    index = index + 1;
                end
            else
                % Diagonal ascendente
                for col = max(1, sum-8+1):min(8, sum)
                    row = sum - col + 1;
                    C(row, col) = x(index);
                    index = index + 1;
                end
            end
        end
    end
end


% Definir las matrices
A = [1 0 1; 4 3 1; -1 0 2];
B = [-1 1 2 3; -4 0 1 5];

% Función de convolución matricial
function Z = con_mat(A, B)
    [m1, n1] = size(A);
    [m2, n2] = size(B);

    Z = zeros(m1 + m2 - 1, n1 + n2 - 1);

    for i = 1:m1 + m2 - 1
        for j = 1:n1 + n2 - 1
            total = 0;
            for k = 1:m1
                for l = 1:n1
                    if (i - k + 1 > 0 && i - k + 1 <= m2 && j - l + 1 > 0 && j - l + 1 <= n2)
                        total = total + A(k, l) * B(i - k + 1, j - l + 1);
                    end
                end
            end
            Z(i, j) = total;
        end
    end
end

% Llamada a la función con_mat
Z = con_mat(A, B);

% Mostrar resultado
disp('Resultado de la convolución:')
disp(Z)


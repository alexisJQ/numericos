
function [sols, errors,xs] = gaussJacobi(A, b, tol)
    %Obtencion de dimensiones
    [M ,N] = size(A);
    %Declaracion de matrices auxiliares
    Q = zeros(M, N);
    C = zeros(M, N);
    D = zeros(M, N);
    %Declaracion de variables auxiliares
    aux = 1;
    %Ciclo desde 1 hasta numero de filas de matriz A
    for i = 1 : M
       %diagonal
       Q(i, i) = A(i, i);
       for j = 1 : aux
          C(i, j) = A(i, j); 
          D(j, i) = A(j, i);
       end
       %Diagonales igualadas a 0
       C(i, i) = 0;
       D(i, i) = 0;
       aux = aux + 1;
    end
    %Punto inicial y declaracion de arreglos
    x0 = zeros(N ,1);
    sols = [];
    errors = [];
    %Ciclo desde 1 hasta 100
    for i = 1 : 100
       T = inv(Q)*(-C-D);
       c = inv(Q) * b;
       x1 = T*x0 + c;
       e = norm(x1 - x0, inf)/norm(x1, inf);
       sols = [sols, x1];
       errors = [errors, e];
       if(e < tol)
           break
       end
       x0 = x1;
    end
    xs = x1;
end
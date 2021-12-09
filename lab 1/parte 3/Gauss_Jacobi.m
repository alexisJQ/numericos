function [sol, e, xs] = Gauss_Jacobi(A, b, tol)
    [M,N] = size(A);
    
    % matrices para el desarrollo de la solucion
    D = zeros(M, N); % matriz diagonal de A
    L = zeros(M, N); % matriz triangular inferior de A
    R = zeros(M, N); % matriz triangular superior de A
    
    %generacion de matrices D, L ,R
    for i = 1 : M
       D(i, i) = A(i, i);    % valores de la diagonal de la matriz A
       for j = 1 : N
           if(i > j)
              L(i, j) = A(i, j);    %valores para la matriz triangular inferior de A
           elseif (j > i)
               R(i, j) = A(i, j);   %valores para la matriz triangular superior de A
           end
       end
    end
    
    %Punto inicial y declaracion de arreglos
    x0 = zeros(N ,1);
    sol = [];
    error = [];
    
    for i = 1 : 1000
        T = inv(D) * -(L + R);
        C = inv(D) * b;
        x1 = T*x0 + C;
        e = norm(x1 - x0, inf) / norm(x1, inf);
        error = [error, e];
        sol = [sol, x1];
        xs = x1;
        x0 = x1;
        if e < tol
            break
        end
    end
        
end
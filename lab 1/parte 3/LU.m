function [L, U]  = LU(A)

    [M, N] = size(A);
    L = zeros(M);
    U = zeros(M);

    for i = 1 : N
       L(i, i) = 1;
       U(1, i) = A(1, i);
       if ( i > 1)
           L(i,1) = A(i, 1) / U(1, 1);
       end
    end
    
    for j = 2 : N
        for i = j : N
            suma_u = 0;
            suma_l = 0;
            for k = 1 : j-1
               suma_u = suma_u + L(j, k) * U(k, i);
               suma_l = suma_l + L(i, k) * U(k, j);
            end
            U(j, i) = A(j, i) - suma_u;
            L(i, j) =(A(i, j) - suma_l) / U(j, j);
        end
    end
end


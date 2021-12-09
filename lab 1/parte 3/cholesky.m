function [L] = cholesky(A)
    [M, N] = size(A);
    L = zeros(M);
    
    L(1, 1) = sqrt(A(1, 1));
    for i = 2 : N
        L(i, 1) = A(i, 1) / L(1, 1);
    end
    
    for j = 2 : N
       suma1 = A(j, j);
       for k = 1 : j - 1
          suma1 = suma1 - L(j, k)^2; 
       end
       L(j, j) = sqrt(suma1);
       for i = j + 1 : N
          suma2 = A(i, j);
          for k = 1 : j - 1
            suma2 = suma2 - L(i, k) * L(j, k);
          end
          L(i, j) = suma2 / L(j, j);
       end
    end
    
end
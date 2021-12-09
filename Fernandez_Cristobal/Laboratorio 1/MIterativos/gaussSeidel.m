function [sols, errors,xs] = gaussSeidel(A, b, tol)
    [M ,N] = size(A);
    Q = zeros(M, N);
    C = zeros(M, N);
    D = zeros(M, N);
    aux = 1;
    
    for i = 1 : M
       Q(i, i) = A(i, i);
       for j = 1 : aux
          C(i, j) = A(i, j); 
          D(j, i) = A(j, i);
       end
       C(i, i) = 0;
       D(i, i) = 0;
       aux = aux + 1;
       
    end
    x0 = zeros(N ,1);
    sols = [];
    errors = [];
    for i = 1 : 100
       T = inv(Q+C) * -D;
       c = inv(Q+C) * b;
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
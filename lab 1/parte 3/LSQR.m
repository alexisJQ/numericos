function [x, error] = LSQR(A, b, tol)
    [M,N]=size(A);
    B = norm(b);
    u = b / B;
    a = norm(A' * u);
    v = A' * u / a;
    w = v;
    x = 0;
    phi = B;
    rho = a;
    error = 100;
    while (error > tol)
       B = norm(A*v - a*u);
       u = (A*v - a*u) / B;
       a = norm(A'*u - B*v);
       v = (A'*u - B*v) / a;
       
       r = sqrt(rho^2+B^2);
       c = rho / r;
       s = B / r;
       theta = s * a;
       rho = -c * a;
       p = c * phi;
       phi = s * phi;
       
       x = x + (p / r)*w;
       w = v - (theta / r) * w;
       
       error = norm(A*x-b);
    end
end

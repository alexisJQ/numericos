function [x,error, iter] = secante(a, b, tol, f)
    x = [];
    error = [];
    xi = b-f(b)*(a-b)/(f(a)-f(b));
    error = [error, f(xi)];
    x = [x, xi];
    a = b;
    b = xi;
    iter = 1;
    while  abs(f(xi)) > tol 
        xi = b-f(b)*(a-b)/(f(a)-f(b));
        error = [error, f(xi)];
        x = [x, xi];
        a = b;
        b = xi;
        iter = iter + 1;
    end
    iter
    f(xi)
end
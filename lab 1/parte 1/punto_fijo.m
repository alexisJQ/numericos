function [x, error, iter] = punto_fijo(a, tol, f, g)
    error = [];
    x = [];
    syms x
    gdiff = diff(g, x);
    xi = g(a);
    error = [error, f(xi)];
    x = [x, xi];
    iter = 1;
    while (abs(f(xi)) > tol) && (abs(subs(gdiff, xi)) < 1)
        a = xi;
        xi = g(a);
        error = [error, f(xi)];
        x = [x, xi];
        iter = iter + 1;
    end
    iter
    f(xi)
end
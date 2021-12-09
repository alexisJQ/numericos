function [x, error, iter] = regula_falsi(a, b, tol, f)
    x=[];
    error=[];
    c = a;
    iter = 0;
    while  abs(f(c)) > tol
        c = (a*f(b)-b*f(a))/(f(b)-f(a));
        if f(c) == 0
            a = c;
            b = c;
        elseif sign(f(a)) ==  sign(f(c))
            a = c;
        elseif sign(f(b)) ==  sign(f(c))
            b = c;
        end
        x=[x,c];
        error=[error, f(c)];
        iter = iter + 1;
    end
    iter
    f(c)
end
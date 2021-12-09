function [x, error, iter] = biseccion(a, b, tol, f)
    x=[];
    error=[];
    m=(b-a)/2;
    x=[x,m];
    error=[error,f(m)];
    iter = 1;
    while  abs(f(m)) > tol
        m = a + (b-a)/2;
        if f(m) == 0
            a = m;
            b = m;
        elseif sign(f(a)) ==  sign(f(m))
            a=m;
        elseif sign(f(b)) ==  sign(f(m))
            b=m;
        end
        iter = iter + 1;
        x=[x,m];
        error=[error,f(m)];      
    end
    iter
    f(m)
end
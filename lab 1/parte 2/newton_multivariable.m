function [sol, error] = newton_multivariable(funciones, x0, tol, iter)
    
    sol = [];
    error = [];
    
    variables = {'x' 'y' 'z'};
    j = jacobian(funciones);
    j_inv = inv(j);
    
    for i = 1 : iter
        f_eval = subs(funciones, variables, x0');
        j_inv_eval = subs(j_inv, variables ,x0');
        x1 = x0 - j_inv_eval * f_eval';
        sol = [sol, x1];
        e = norm(x1 - x0, inf) / norm(x1, inf);
        error = [error, e];
        x0 = x1;
        if e < tol
            break
        end
    end
    
    
end
    
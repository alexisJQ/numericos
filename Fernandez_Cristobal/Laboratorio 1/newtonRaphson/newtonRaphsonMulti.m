function [raices, errores] = newtonRaphsonMulti(funciones, x0, tolerancia, n)
    variables = {'x', 'y', 'z'};
    jacobiano = jacobian(funciones);
    
    
    raices = [];
    errores = [];

    for i = 1 :n     
        feval = subs(funciones, variables, x0');
        jeval = subs(jacobiano, variables, x0');
        jacoInv = inv(jeval);
        x1 = x0 - jacoInv*feval';
        raices = [raices , x1];
        e = norm(x1 - x0, inf)/norm(x1, inf);
        errores = [errores , e];
        x0 = x1;
        if(e < tolerancia)
            break;
        end
      
    end
end

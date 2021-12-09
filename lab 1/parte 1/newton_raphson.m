function [x,error] = newton_raphson(x0, tol, f, diff_f)
    x = [];
    error = [];
    x = [x,x0];
    error = [error,f(x0)];
    while abs(f(x0)) > tol
       x0 = x0 - f(x0)/diff_f(x0);
       x = [x,x0];
       error = [error,f(x0)];
       if f(x0) == 0
           break;
       end
    end
%      disp("newton raphson")
%      disp(x0);
%      disp(f(x0));
end
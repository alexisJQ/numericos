function [a, b] = dif(n, Te)
    a = zeros(n);
    b = zeros(n, 1);
    A = 2;
    % ciclo for para llenar la matriz de coef de temperaturas y resultados
    % de estas
    for i = 1:n
        a_i = (i-1);            % coeficiente de t_{i-1}
        b_i = - 2*(i-1) - 1;    % coeficiente de t_{i}
        c_i = (i-1)+1;          % coeficiente de t_{i+1}
        if i == 1               % primera fila considera coef de t_{i}, t_{i+1} 
            b(i, 1) = -A/2;     % resultado que debe llegar la ecuación
            a(i, i) = b_i;
            a(i, i+1) = c_i;
        elseif i == n                       % ultima fila considera coef de t_{i-1}, t_{i}
            b(i, 1) = -A*(i - 1) - n*Te;    % resultado que debe llegar la ecuación
            a(i, i-1) = a_i;
            a(i, i) = b_i;
        else                        % filas intermedias considera coef t_{i-1}, t_{i}, t_{i+1}
            b(i,1) = -A*(i - 1);    % resultado que debe llegar la ecuación
            a(i, i-1) = a_i;
            a(i, i) = b_i;
            a(i, i+1) = c_i;
        end
    end
end


function [map_a, map_fila, map_columna] = map(A)
       
    [m, n] = size(A);
    map_a = [];
    map_fila = [];
    map_columna = [];
    
    for i = 1:m
       for j = 1:n
           if A(i, j) ~= 0
               map_a = [map_a, A(i, j)];
               map_fila = [map_fila, i];
               map_columna = [map_columna, j];
           end
       end
    end
end
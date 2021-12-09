function resp = multiplicar(A, f, c, B)
    resp = [];
    [m,n] = size(A);
    suma = 0;
    for i = 1:n
       suma = suma + A(i)*B(c(i));
       if i == n | f(i) ~= f(i + 1) 
          resp = [resp, suma];
          suma = 0;
       end
    end
    resp = resp';
end
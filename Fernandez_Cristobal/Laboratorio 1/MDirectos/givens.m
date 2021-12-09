function [X,Error] = givens(A,B)
    [m , n] = size(A);
    Q = eye(m);
    R = A;
    for i=1:n
        for k=i+1:m
            if (R(k,i) ~= 0)
                raiz = sqrt(R(k,i)^2 + R(i,i)^2);
                s = -R(k,i)/raiz;
                c = R(i,i)/raiz;
                G = eye(m); % Matriz de rotacion
                G(i,i) = c;
                G(k,k) = c;
                G(k,i) = -s;
                G(i,k) = s;
                Q = Q*G; % Matriz ortogonal
                R = G'*R; % Matriz triangular inferior
 
            end
        end
        
    end
      Y = inv(Q)*B;
      X = inv(R)*Y;
      Error = norm(eye(n)-inv(Q*R)*A);

end
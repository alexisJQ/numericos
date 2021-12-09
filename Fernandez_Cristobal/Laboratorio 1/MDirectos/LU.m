function X = luSolucion(A,B)
[n,n] = size(A)
L = zeros(n,n);
U = A;
for i=1:n
    L(i,i) = 1;
    for j=i+1:n
        L(j,i)= U(j,i)/U(i,i);
        for k=i:n
            U(j,k)= U(j,k) - L(j,i)*U(i,k);
        end
    end
end
X = inv(L*U)*B;
end
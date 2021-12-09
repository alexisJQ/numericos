function [X] = sust_prog(A,b)
    [N,M]=size(A);
    X=zeros(N,1);
    X(1) = b(1)/A(1,1);
    
    for i=2 : N
        X(i) = (b(i)-sum(A(i,1:i-1)*X(1:i-1)))/A(i,i);
    end
end
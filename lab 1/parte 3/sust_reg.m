function x=sust_reg(A,b)
    [N,M]=size(A);
    x=zeros(N,1);
    for i=N:-1:1
        x(i)=b(i);
        for j=i+1:N
            x(i)=x(i)-A(i,j)*x(j);
        end
        x(i)=x(i)/A(i,i);
    end 

end
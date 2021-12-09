function [x, error, operaciones] = LSQR(A, b)
    
    [m, n] = size(A);
    operaciones = 1;
    
    beta = norm(b);             
    operaciones = operaciones + n^2;
    u = b / beta;               
    operaciones = operaciones + n;
    alfa = norm(A'*u);          
    operaciones = operaciones + 3*n^2;
    v = (A'*u)/alfa;            
    operaciones = operaciones  + 2*n^2 + n;
    
    w = v;
    operaciones = operaciones + 1;
    x = 0;
    operaciones = operaciones + 1;
    phi_ = beta;
    operaciones = operaciones + 1;
    rho_ = alfa;
    operaciones = operaciones + 1;
    error = 1;
    operaciones = operaciones + 1;
    
    while (error > 2.4972e-8)
        
        beta = norm(A*v-alfa*u);
        operaciones = operaciones + 2*n^2 + 2*n; 
        u = (A*v-alfa*u)/beta;
        operaciones = operaciones + n^2 + 3*n;
        
        alfa = norm(A'*u-beta*v);
        operaciones = operaciones + 3*n^2 + 3*n;
        v = (A'*u-beta*v)/alfa;
        operaciones = operaciones + n^2 + 3*n;
        
        rho = sqrt(rho_^2+beta^2);
        operaciones = operaciones + 4;
        c = rho_/rho;
        operaciones = operaciones + 1;
        s = beta/rho;
        operaciones = operaciones + 1;
        theta = s*alfa;
        operaciones = operaciones + 1;
        rho_ = -c*alfa;
        operaciones = operaciones + 1;
        phi = c*phi_;
        operaciones = operaciones + 1;
        phi_ = s*phi_;
        operaciones = operaciones + 1;
        
        x = x+(phi/rho)*w;
        operaciones = operaciones + 1 + 2*n;
        w = v-(theta/rho)*w;
        operaciones = operaciones + 1 + 2*n;
        
        error = norm(A*x-b);
        operaciones = operaciones + 2*n^2 + n;
    end
end
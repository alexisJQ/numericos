function [x, error, operaciones] = LSQR_opt(A, b)
    
    operaciones = 0;
    
    [f, c] = size(A);
    [m_a, m_f, m_c] = map(A);
    operaciones = operaciones + c^2 + 1;
    [m_a_t, m_f_t, m_c_t] = map(A');
    operaciones = operaciones + 2*c^2;
    [m, n] = size(m_a);
    operaciones = operaciones + 1;
    
    beta = norm(b);
    operaciones = operaciones + c;
    u = b / beta;
    operaciones = operaciones + c;

    aux = multiplicar(m_a_t, m_f_t, m_c_t, u);
    operaciones = operaciones + n;
    alfa = norm(aux);          
    operaciones = operaciones + c^2;
    v = (aux)/alfa;            
    operaciones = operaciones  + c;
    
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
    
    while error > 2.0623e-8
        
        aux = multiplicar(m_a, m_f, m_c, v);
        operaciones = operaciones + n;
        beta = norm(aux-alfa*u);
        operaciones = operaciones + c^2 + 2*c; 
        u = (aux-alfa*u)/beta;
        operaciones = operaciones + c;
        
        aux = multiplicar(m_a_t, m_f_t, m_c_t, u);
        operaciones = operaciones + n;
        alfa = norm(aux-beta*v);
        operaciones = operaciones + c^2 + 2*c;
        v = (aux-beta*v)/alfa;
        operaciones = operaciones + c;
        
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
        operaciones = operaciones + 1 + 2*c;
        w = v-(theta/rho)*w;
        operaciones = operaciones + 1 + 2*c;
        
        aux = multiplicar(m_a, m_f, m_c, x);
        operaciones = operaciones + n;
        error = norm(aux-b);
        operaciones = operaciones + c^2 + c;
    end
end
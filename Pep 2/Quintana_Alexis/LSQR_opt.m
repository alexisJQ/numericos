function [x] = LSQR_opt(A, b)
    
    [f, c] = size(A);
    [m_a, m_f, m_c] = map(A);
    [m_a_t, m_f_t, m_c_t] = map(A');
    [m, n] = size(m_a);
    
    beta = norm(b);
    u = b / beta;

    aux = multiplicar(m_a_t, m_f_t, m_c_t, u);
    alfa = norm(aux);          
    v = (aux)/alfa;           
    
    w = v;
    x = 0;
    phi_ = beta;
    rho_ = alfa;
    error = 1;
    
    while error > 4.0e-07
        aux = multiplicar(m_a, m_f, m_c, v);
        beta = norm(aux-alfa*u);
        u = (aux-alfa*u)/beta;
        
        aux = multiplicar(m_a_t, m_f_t, m_c_t, u);
        alfa = norm(aux-beta*v);
        v = (aux-beta*v)/alfa;
        
        rho = sqrt(rho_^2+beta^2);
        c = rho_/rho;
        s = beta/rho;
        theta = s*alfa;
        rho_ = -c*alfa;
        phi = c*phi_;
        phi_ = s*phi_;
        
        x = x+(phi/rho)*w;
        w = v-(theta/rho)*w;
        
        aux = multiplicar(m_a, m_f, m_c, x);
        error = norm(aux-b);
    end
end
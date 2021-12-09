function [] = mov_sen(A, b)
    
    % data of the nodes_sen
    p = load('datos\nodos.dat');        %4225x2
    e = load('datos\fronteras.dat');    %256x7
    t = load('datos\elementos.dat');    %8192x4
    p0 = p';                            %2x4225
    e0 = e';                            %7x256
    t0 = t';                            %4x8192
    density = 50000;
    
    % video configuration and iterations
    v = VideoWriter('mov.avi');
    iters = 10;
    v.FrameRate = iters / 5;
    open(v);
    
    % get nodes for lineal move
    R = 2.5;
    nodes_lin = zeros(iters, 1);
    i = 1;
    while i <= 2
        new_node = true;
        node = randi(4225);
        for j = 1:256 & new_node == true
            if node == e(j, 1)
               new_node = false; 
            end
        end
        if i ~= 1
            for j = 1:i-1
               if node == nodes_lin(j, 1) 
                  new_node = false; 
               end
            end
        end
        if norm([p(node, 1) p(node, 2)]-[0 0]) >= R
            new_node = false;
        end
        if new_node == true
            nodes_lin(i, 1) = node;
            i = i+1;
        end
    end
    y_1 = p(nodes_lin(1,1),2);
    x_1 = p(nodes_lin(1,1),1);
    m = (p(nodes_lin(1,1),2) - p(nodes_lin(2,1),2)) / (p(nodes_lin(1,1),1) - p(nodes_lin(2,1),1));
    
    if p(nodes_lin(1,1),1) > p(nodes_lin(2,1),1)
       mayor = p(nodes_lin(1,1),1);
       menor = p(nodes_lin(2,1),1);
    else
       menor = p(nodes_lin(1,1),1);
       mayor = p(nodes_lin(2,1),1);
    end
    
    pos_x = linspace(menor, mayor, iters);
    
    for i = 1:iters
       pos = [pos_x(1, i) (m*(pos_x(1,i) - x_1) + y_1)];
       node = 0;
       dist = 10;
       for j = 1:4225
           aux = [p(j, 1) p(j, 2)];
           if norm(aux-pos) < dist
               node = j;
               dist = norm(aux-pos);
           end
       end
       nodes_lin(i, 1) = node;
    end
        
    % set values and get max value
    b(:,1)=0;
    maximo = 0;
    for j = 1:iters
        b(nodes_lin(j, 1),1) = density;
        u = linsolve(A,b);
        if maximo < max(u)
           maximo = max(u); 
        end
        b(:,1)=0;
    end
    
    
    % video generation
    for k = 1:iters
       b(:,1)=0;
       b(nodes_lin(k,1),1) = density;
       u = LSQR_opt(A,b);
%        u = linsolve(A, b);
       %se hace el grafico
       [ux,uy] = pdegrad(p0,t0,u); % Calculate gradient
       ugrad = [ux;uy];
       h = pdeplot(p0,e0,t0,'xydata',u,'zdata',u,...
           'colormap','jet','mesh','on', 'flowdata',ugrad,'FaceAlpha',0.9);
       title('movimiento lineal');
       axis([-4 4 -4 4 1 maximo]);
       caxis([0 maximo]);
       view(2);
       frame = getframe(gcf);

       writeVideo(v,frame);

    end
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % get nodes for not lineal move
    R = 2;
    mayor = sqrt(R);
    menor = -mayor;
    nodes_nlin = zeros(iters, 1);
    pos_x = linspace(menor, mayor, iters);
    for i = 1:iters
       pos = [pos_x(1, i) pos_x(1, i)*pos_x(1,i)];
       node = 0;
       dist = 10;
       for j = 1:4225
           aux = [p(j, 1) p(j, 2)];
           if norm(aux-pos) < dist
               node = j;
               dist = norm(aux-pos);
           end
       end
       nodes_nlin(i, 1) = node;
    end
        
    % set values and get max value
    b(:,1)=0;
    maximo = 0;
    for j = 1:iters
        b(nodes_nlin(j, 1),1) = density;
        u = linsolve(A,b);
        if maximo < max(u)
           maximo = max(u); 
        end
        b(:,1)=0;
    end
    
    
    % video generation
    for k = 1:iters
       b(:,1)=0;
       b(nodes_nlin(k,1),1) = density;
       u = LSQR_opt(A,b);
%        u = linsolve(A, b);
       %se hace el grafico
       [ux,uy] = pdegrad(p0,t0,u); % Calculate gradient
       ugrad = [ux;uy];
       h = pdeplot(p0,e0,t0,'xydata',u,'zdata',u,...
           'colormap','jet','mesh','on', 'flowdata',ugrad,'FaceAlpha',0.9);
       title('movimiento no lineal');
       axis([-4 4 -4 4 1 maximo]);
       caxis([0 maximo]);
       view(2);
       frame = getframe(gcf);

       writeVideo(v,frame);

    end
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % get nodes for senoide move
    R = 1+1.5*rand();
    nodes_sen = zeros(iters, 1);
    i = 1;
    while i <= iters
        new_node = true;
        pos = [R*cos((2*pi/iters)*i) R*sin((2*pi/iters)*i)];
        node = 0;
        dist = 10;
        for j = 1:4225
            aux = [p(j, 1) p(j, 2)];
            if norm(aux-pos) < dist
                node = j;
                dist = norm(aux-pos);
            end
        end
        for j = 1:256 & new_node == true
            if node == e(j, 1)
               new_node = false; 
            end
        end
        if new_node == true
            nodes_sen(i, 1) = node;
            i = i+1;
        end
    end
    
    
    
    % set values and get max value
    b(:,1)=0;
    maximo = 0;
    for j = 1:iters
        b(nodes_lin(j, 1),1) = density;
        u = linsolve(A,b);
        if maximo < max(u)
           maximo = max(u); 
        end
        b(:,1)=0;
    end
    
    
    % video generation
    for k = 1:iters
       b(:,1)=0;
       b(nodes_sen(k,1),1) = density;
       u = LSQR_opt(A,b);
%        u = linsolve(A, b);
       %se hace el grafico
       [ux,uy] = pdegrad(p0,t0,u); % Calculate gradient
       ugrad = [ux;uy];
       h = pdeplot(p0,e0,t0,'xydata',u,'zdata',u,...
           'colormap','jet','mesh','on', 'flowdata',ugrad,'FaceAlpha',0.9);
       title('movimiento senoide');
       axis([-4 4 -4 4 1 maximo]);
       caxis([0 maximo]);
       view(2);
       frame = getframe(gcf);

       writeVideo(v,frame);

    end

    close(v)
end


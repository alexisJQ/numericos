function [] = fuentes(A, b, min_foto, max_foto, sources)
    disp("Generando video de fotones")
    % data of the nodes
    p = load('datos\nodos.dat');        %4225x2
    e = load('datos\fronteras.dat');    %256x7
    t = load('datos\elementos.dat');    %8192x4
    p0 = p';                            %2x4225
    e0 = e';                            %7x256
    t0 = t';                            %4x8192
    
    % get random nodes and density
    R = 2.5;
    nodes = zeros(sources, 1);
    density = randi([min_foto, max_foto], sources, 2);
    i = 1;
    while i <= sources
        new_node = true;
        node = randi(4225);
        for j = 1:256 & new_node == true
            if node == e(j, 1)
               new_node = false; 
            end
        end
        if i ~= 1
            for j = 1:i-1
               if node == nodes(j, 1) 
                  new_node = false; 
               end
            end
        end
        if norm([p(node, 1) p(node, 2)]-[0 0]) >= R
            new_node = false;
        end
        if new_node == true
            nodes(i, 1) = node;
            i = i+1;
        end
    end
    
    % video configuration and iterations
    v = VideoWriter('fotones.avi');
    iters = 15;
    v.FrameRate = iters / 15;
    open(v);
    
    % set values
    b(:,1)=0;
    for i = 1:sources
       b(nodes(i, 1),1) = density(i,1);
       density(i, 2) = (density(i, 1) / 2) / iters;
    end
    
    % get max value
    for j = 1: sources
        b(nodes(j, 1),1) = b(nodes(j, 1),1) + density(j,1)/2;
    end
    
    u = linsolve(A,b);
    maximo = max(u);
    
    % set values
    b(:,1)=0;
    for i = 1:sources
       b(nodes(i, 1),1) = density(i,1);
       density(i, 2) = (density(i, 1) / 2) / iters;
    end
    
    % video generation
    for k = 1:iters
       u = LSQR_opt(A,b);
       lin = linsolve(A, b);
       %se hace el grafico
       [ux,uy] = pdegrad(p0,t0,u); % Calculate gradient
       ugrad = [ux;uy];
       h = pdeplot(p0,e0,t0,'xydata',u,'zdata',u,...
           'colormap','jet','mesh','on', 'flowdata',ugrad,'FaceAlpha',0.9);
       xlabel(strcat('error absoluto:  ', string(norm(u - lin))));
       for j = 1: sources
            b(nodes(j, 1),1) = b(nodes(j, 1),1) + density(j,2);
       end
       axis([-4 4 -4 4 1 maximo]);
       caxis([0 maximo]);
       view(3);
       frame = getframe(gcf);

       writeVideo(v,frame);

    end

    close(v)
    disp("Video de fotones generado")
end


function [] = cilindro(R, n, h, T)

    r = 0:R/n:R; % radios de las superficies de estudio
    z = 0:0.1:h;  % altura del programa
    [rr, zz] = meshgrid(r,z);
    nitidez =0.5;
    % temerature data
    temp = (5-rr).*(1-rr);
    [n, m] = size(temp);
    for i = 1:n
        for j = 1:m
            temp(i, j) = T(1, j);
        end
    end

    figure(1);
    clf;

    % polar meshgrid for the top end-cap
    t = linspace(0, 2*pi, 50);

    [rr, tt] = meshgrid(r,t);
    xx1 = rr .* cos(tt);
    yy1 = rr .* sin(tt);
    zz1 = ones(size(rr)) * max(z);
    temp1 = zeros(size(rr));
    for k = 1:length(r)
        temp1(:,k) = temp(end,k);
    end
    surface(xx1,yy1,zz1,temp1,'EdgeColor', 'none','FaceAlpha',nitidez);

    % polar meshgrid for the bottom end-cap
    zz2 = ones(size(rr)) * min(z);
    temp2 = zeros(size(rr));
    for k = 1:length(r)
        temp2(:,k) = temp(1,k);
    end
    surface(xx1,yy1,zz2,temp2,'EdgeColor', 'none','FaceAlpha',nitidez);

    % generate a curved meshgrid
    [tt2, zz3] = meshgrid(t,z);
    xx3 = r(end) * cos(tt2);
    yy3 = r(end) * sin(tt2);
    temp3 = zeros(size(xx3));
    for k = 1:length(z)
        temp3(k,:) = temp(k,end);
    end
    h5 = surface(xx3, yy3, zz3,temp3,'EdgeColor', 'none','FaceAlpha',nitidez);

    
    hold on
    axis equal
    colorbar
    view(120,10);  % viewing angles
end


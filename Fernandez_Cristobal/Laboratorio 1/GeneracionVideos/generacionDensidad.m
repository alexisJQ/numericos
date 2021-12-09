% se cargan los datos
A = load('A289.dat');
b = load('b289.dat');
p= load('nodos.dat'); %289x2
e = load('fronteras.dat');%64x7
t = load('elementos.dat');%512 x 4
p0 = p'; %2x289
e0 = e';%7x64
t0 = t';%4 x 512 
close all
axis tight manual

v = VideoWriter('densidad.avi','Motion JPEG AVI');
open(v);

iter = 30;
b2 = b;
bTemporal = b2;
tmp = b2;
base = 1;

maxim = 10000000000;
for i=1:iter
    if i>1
        base = base +0.025;
    end    
    bTemporal = bTemporal*(base)^i ; 
    u = cholesky(A,bTemporal);
    
    [ux,uy] = pdegrad(p0,t0,u); % Calculate gradient
    ugrad = [ux;uy];
    %figure(i)
    
    h = pdeplot(p0,e0,t0,'xydata',u,'zdata',u,...
    'colormap','jet','mesh','on','flowdata',ugrad);
    zlim([0 maxim]);
    frame = getframe(gcf);
    for k=1:4
            writeVideo(v,frame)
    end
    pause(0.05)
    
    
    
end
close(v);



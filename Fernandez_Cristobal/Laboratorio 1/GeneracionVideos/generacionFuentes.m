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

b2 = b;
b2 = b2*0;
base = 1.05;
nodos = p;
max = 1000;
v = VideoWriter('fuentes.avi','Motion JPEG AVI');
open(v);

for i = 1:10
    b2 = b2*0;
    for j=1:10
        var=abs(floor(289*rand()));
        if var==0
            var=1;
        end
        if sqrt(p0(1,var)^2 + p0(2,var)^2) < 2
            b2(var,1) = 10;
        end
        temp = b2*base^(j);
        u = cholesky(A,temp);
        [ux,uy] = pdegrad(p0,t0,u); % Calculate gradient
        ugrad = [ux;uy];
        h = pdeplot(p0,e0,t0,'xydata',u,'zdata',u,...
         'colormap','jet','mesh','on','flowdata',ugrad);
        zlim([0 max]);
        frame = getframe(gcf);
        
        
        for k=1:4
            writeVideo(v,frame)
        end
        
        
        pause(0.05)
        
    end
end
close(v);

clc;
m1 = 10;
h0 = 0.5;
x = 1:h0:m1;
x = [0 1 2.5 3.6 5 7 8.1 10];
y = sin(x);
xx = 0:.25:10;
yy = spline(x,y,xx);
plot(x,y,'o',xx,yy)
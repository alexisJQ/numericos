clear
close all

syms x y z
iter = 12;
f1 = x^2 + y - 37;
f2 = x - y^2 - 5;
f3 = x + y + z - 3;
x0 = [0 0 0]';
F = [f1, f2, f3];
tolerancia = 1.e-10;

tic;
[sol, error] = newton_multivariable(F, x0, tolerancia, iter);
toc
% vpa(sol, 10)

figure()
plot(error, '-*');
axis([1 12 -0.1 1.1])
grid on
title('analisis de error')
xlabel('iteracion')  % etiqueta para el nombre del eje x
ylabel('error')  % etiqueta para el nombre del eje y
clear
close all
%funciones que deben ser probadas.
tolerancia = 1.e-10;
f1 = @(x) x - 2^(-x);
f2 = @(x) exp(-x) - x^(2) + 3*x - 2;
f3 = @(x) x^3 - 7*x^2 + 14*sin(2*pi*x) - 6;

%funciones contractivas
g1 = @(x) 2^(-x);
g2 = @(x) (2 + x^(2) - exp(-x)) / 3;
g3 = @(x) (7*x^(2) - 14*sin(2*pi*x) + 6) / x^2;


%comprobacion metodos para f1
% se observa cambio de signo entre -1 y 2 para f2
a = -1;
b = 2;

tic;
[x_b1,e_b1, i_b1] = biseccion(a, b, tolerancia, f1);
t_b1 = toc

tic;
[x_rf1, e_rf1, i_rf1] = regula_falsi(a, b, tolerancia, f1);
t_rf1 = toc

tic;
[x_s1, e_s1, i_s1] = secante(a, b, tolerancia, f1);
t_s1 = toc

tic;
[x_pf1, e_pf1, i_pf1] = punto_fijo(a, tolerancia, f1, g1);
t_pf1 = toc

figure(1)
plot(e_b1, '-*')
grid on
xlabel('iteracion')  % etiqueta para el nombre del eje x
ylabel('aproximacion')  % etiqueta para el nombre del eje y

hold on
plot(e_rf1, '-s')
plot(e_s1, '-o')
plot(e_pf1, '-d')
legend('biseccion', 'regula falsi', 'secante', 'punto fijo')
hold off

%comprobacion metodos para f2
% se observa cambio de signo entre 0 y 1 para f2
a = 0;
b = 1;

tic;
[x_b2,e_b2, i_b2] = biseccion(a, b, tolerancia, f2);
t_b2 = toc

tic;
[x_rf2, e_rf2, i_rf2] = regula_falsi(a, b, tolerancia, f2);
t_rf2 = toc

tic;
[x_s2, e_s2, i_s2] = secante(a, b, tolerancia, f2);
t_s2 = toc

tic;
[x_pf2, e_pf2, i_pf2] = punto_fijo(a, tolerancia, f2, g2);
t_pf2 = toc

figure(2)
plot(e_b2, '-*')
grid on
xlabel('iteracion')  % etiqueta para el nombre del eje x
ylabel('aproximacion')  % etiqueta para el nombre del eje y

hold on
plot(e_rf2, '-s')
plot(e_s2, '-o')
plot(e_pf2, '-d')
legend('biseccion', 'regula falsi', 'secante', 'punto fijo')
hold off

%comprobacion metodos para f3
% se observa cambio de signo entre -10 y 10 para f2
a = -10;
b = 10;

tic;
[x_b3,e_b3, i_b3] = biseccion(a, b, tolerancia, f3);
t_b3 = toc

tic;
[x_rf3, e_rf3, i_rf3] = regula_falsi(a, b, tolerancia, f3);
t_rf3 = toc

tic;
[x_s3, e_s3, i_s3] = secante(a, b, tolerancia, f3);
t_s3 = toc

tic;
[x_pf3, e_pf3, i_pf3] = punto_fijo(a, tolerancia, f3, g3);
t_pf3 = toc

figure(3)
plot(e_b3, '-*')
grid on
xlabel('iteracion')  % etiqueta para el nombre del eje x
ylabel('aproximacion')  % etiqueta para el nombre del eje y

hold on
plot(e_rf3, '-s')
plot(e_s3, '-o')
plot(e_pf3, '-d')
legend('biseccion', 'regula falsi', 'secante', 'punto fijo')
hold off





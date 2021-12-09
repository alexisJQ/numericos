close all
% Variables principales del problema
Te = input('Ingrese la temperatura externa del cilindro:\n');    % temperatura en la capa mas externa del cilindro
n = input('Ingrese la cantidad de superficies a analizar:\n');     % numero de superficies del cilindro a evaluar
R = input('Ingrese el radio del cilindro:\n');     % radio del cilindro
h = input('Ingrese la altura del cilindro:\n');     % altura del cilindro

[A, b] = dif(n, Te);
T = linsolve(A, b);
T = [T', Te];

cilindro(R, n, h, T);
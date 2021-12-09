% 1. Sistema de ecuaciones: 

n = 12;
x0 = [0 0 0]';
syms x y z
f1 = x^2 + y - 37;
f2 = x - y^2 - 5;
f3 = x + y + z - 3;
F3 = [f1, f2, f3];
error = 10^-10;

[sol, errorN] = newtonRaphsonMulti(F3, x0, error, n);
round(sol);

errorN;



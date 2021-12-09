clc
A = load("A4225.dat");
b = load("b4225.dat");

disp("prueba maping y de multiplicacion");
[a, f, c] = map(A);
resp = multiplicar(a, f, c, b);
error = norm(A*b-resp);
disp(strcat("error obtenido en comparacion a operacion A*b de matlab: ", num2str(error)));
disp("***************************************************************");
disp("ejecucion de LSQR");
tic;
[x1, error1, operaciones1] = LSQR(A,b);
toc
disp(strcat("error: ", num2str(error1)));
disp("operaciones realizadas: ");
disp(operaciones1);
disp("***************************************************************");
disp("ejecucion de LSQR optimizado");
tic;
[x2, error2, operaciones2] = LSQR_opt(A,b);
toc
disp(strcat("error: ", num2str(error2)));
disp("operaciones realizadas: ");
disp(operaciones2);
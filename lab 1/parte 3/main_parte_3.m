clear
close all
error = 10^-8;

disp("Analisis de matriz 289x289")
%%%%%%%%%%%%%%%%%%%%%%%%%
%Con la matriz de 289x289
A1 = load('A289.dat');
b1 = load('b289.dat');

% LU
tic;
[L1, U1] = LU(A1);
zLU1 = sust_prog(L1, b1);
valorLU1 = sust_reg(U1, zLU1);
errorLU1 = norm(A1*valorLU1 - b1)
tiempoLU1 = toc

%Cholesky
tic;
[L1] = cholesky(A1);
zCho1 = sust_prog(L1, b1);
valorCho1 = sust_reg(L1', zCho1);
errorCho1 = norm(A1*valorCho1 - b1)
tiempoCho1 = toc

%QR
tic;
[Q1, R1] = QR(A1);
zQR1 = Q1'*b1;
valorQR1 = sust_reg(R1, zQR1);
errorQR1 = norm(A1*valorQR1 - b1)
tiempoQR1 = toc

%LSQR
tic;
[valorLSQR1, errorLSQR1] = LSQR(A1, b1, error);
errorLSQR1
tiempoLSQR1 = toc

%Gauss.Seidel
tic,
[SolucSeidel, errorSei1, valorSeiM1] = Gauss_Seidel(A1, b1, error);
errorSei1
tiempoS1 = toc

%Gauss.Jacobi
tic,
[SolucJacobi1, errorJacobi1, valorJacobi1] = Gauss_Jacobi(A1, b1, error);
errorJacobi1
tiempoJ1 = toc

disp("Analisis de matriz 1089x1089")
% %%%%%%%%%%%%%%%%%%%%%%%%%
%Con la matriz de 1089x1089
A2 = load('A1089.dat');
b2 = load('b1089.dat');

% LU
tic;
[L2, U2] = LU(A2);
zLU2 = sust_prog(L2, b2);
valorLU2 = sust_reg(U2, zLU2);
errorLU2 = norm(A2*valorLU2 - b2)
tiempoLU2 = toc

%Cholesky
tic;
[L2] = cholesky(A2);
zCho2 = sust_prog(L2, b2);
valorCho2 = sust_reg(L2', zCho2);
errorCho2 = norm(A2*valorCho2 - b2)
tiempoCho2 = toc

%QR
tic;
[Q2, R2] = QR(A2);
zQR2 = Q2'*b2;
valorQR2 = sust_reg(R2, zQR2);
errorQR2 = norm(A2*valorQR2 - b2)
tiempoQR2 = toc

%LSQR
tic;
[valorLSQR2, errorLSQR2] = LSQR(A2, b2, 1.e-8);
errorLSQR2
tiempoLSQR2 = toc

%Gauss.Seidel
tic;
[SolucSeide2, errorSei2, valorSeiM2] = Gauss_Seidel(A2, b2, error);
errorSei2
tiempoS2 = toc

%Gauss.Jacobi
tic;
[SolucJacobi2, errorJacobi2, valorJacobi2] = Gauss_Jacobi(A2, b2, error);
errorJacobi2
tiempoJ2 = toc

disp("Analisis de matriz 4225x4225")
%%%%%%%%%%%%%%%%%%%%%%%%%
%Con la matriz de 4225x4225
A3 = load('A4225.dat');
b3 = load('b4225.dat');

% LU
tic;
[L3, U3] = LU(A3);
zLU3 = sust_prog(L3, b3);
valorLU3 = sust_reg(U3, zLU3);
errorLU3 = norm(A3*valorLU3 - b3)
tiempoLU3 = toc

%Cholesky
tic;
[L3] = cholesky(A3);
zCho3 = sust_prog(L3, b3);
valorCho3 = sust_reg(L3', zCho3);
errorCho3 = norm(A3*valorCho3 - b3)
tiempoCho3 = toc

%QR
tic;
[Q3, R3] = QR(A3);
zQR3 = Q3'*b3;
valorQR3 = sust_reg(R3, zQR3);
errorQR3 = norm(A3*valorQR3 - b3)
tiempoQR3 = toc

%LSQR
tic;
[valorLSQR3, errorLSQR3] = LSQR(A3, b3, 3.e-8);
errorLSQR3
tiempoLSQR3 = toc

%Gauss.Seidel
tic;
[SolucSeide3, errorSei3, valorSeiM3] = Gauss_Seidel(A3, b3, error);
errorSei3
tiempoS3 = toc

%Gauss.Jacobi
tic;
[SolucJacobi3, errorJacobi3, valorJacobi3] = Gauss_Jacobi(A3, b3, error);
errorJacobi3
tiempoJ3 = toc
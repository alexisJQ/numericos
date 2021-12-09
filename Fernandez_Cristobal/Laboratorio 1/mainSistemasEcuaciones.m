clear
error = 10^-10;

%Con la matriz de 289x289
A1 = load('A289.dat');
b1 = load('b289.dat');
% 

%Gauss.Jacobi
tic,
[SolucJacobi1, ErrorJacobi1, valorJacobi1] = gaussJacobi(A1, b1, error);
tiempoJ1 = toc;

%Gauss.Seidel
tic,
[SolucSei1, ErrorSeiM1, valorSeiM1] = gaussSeidel(A1, b1, error);
tiempoS1 = toc;

%Cholesky
tic,
[valorChoM1, ErrorChoM1] = cholesky(A1, b1);
tiempoC1 = toc;

%QR
tic,
[valorQRM1, ErrorQRM1] = QR(A1, b1);
tiempoQ1 = toc;

%Givens
tic,
[valorGivM1, ErrorGivM1] = givens(A1,b1);
tiempoGiv1 = toc;

%LU
tic,
[valorLUM1, errorLUM1]= LU(A1,b1);

%tiempo1 = [tiempoJ1,tiempoS1,tiempoC1,tiempoQ1,tiempoGiv1];
%graficarValorSG(valorChoM1,tiempoGiv1,valorQRM1);
%graficarValoresIt(SolucJacobi1, SolucSei1, 'Aproximaciones sistema 289');


% %Matriz de 1089x1089
% 
% A2 = load('A1089.dat');
% b2 = load('b1089.dat');
% 
%  %Gauss.Jacobi
% tic,
% [SolucJacobi2, ErrorJacobi2, valorJacobi2] = gaussJacobi(A2, b2, error);
% tiempoJ2 = toc;
% 
% %Gauss.Seidel
% tic,
% [SolucSei2, ErrorSeiM2, valorSeiM2] = gaussSeidel(A2, b2, error);
% tiempoS2 = toc;
% 
% %Cholesky
% tic,
% [valorChoM2, ErrorChoM2] = cholesky(A2, b2);
% tiempoC2 = toc;
% 
% %QR
% tic,
% [valorQRM2, ErrorQRM2] = QR(A2, b2);
% tiempoQ2 = toc;
% 
% % Givens
% % tic,
% % [valorGivM2, ErrorGivM2] = givens(A2,b2);
% % tiempoGiv2 = toc;
% 
% % tiempo2 = [tiempoJ2,tiempoS2,tiempoD2,tiempoHou2,tiempoC2,tiempoQ2,tiempoGiv2];
% graficarValorSG(valorChoM2,tiempoGiv1,valorQRM2);
% graficarValoresIt(SolucJacobi2, SolucSei2, 'Aproximaciones sistema 1089');

%4225
% A3 = load('A4225.dat');
% b3 = load('b4225.dat');
% 
% %Gauss.Jacobi
% tic,
% [SolucJacobi3, ErrorJacobi3, valorJacobi3] = gaussJacobi(A3, b3, error);
% tiempoJ3 = toc;
% 
% %Gauss.Seidel
% tic,
% [SolucSei3, ErrorSeiM3, valorSeiM3] = gaussSeidel(A3, b3, error);
% tiempoS3 = toc;
% 
% %Cholesky
% tic,
% [valorChoM3, ErrorChoM3] = cholesky(A3, b3);
% tiempoC3 = toc;
% 
% %QR
% tic,
% [valorQRM3, ErrorQRM3] = QR(A3, b3);
% tiempoQ3 = toc;
% 
% %Givens
% tic,
% [valorGivM3, ErrorGivM3] = givens(A3,b3);
% tiempoGiv3 = toc;
% 
% 
% graficarValorSG(valorChoM3,tiempoGiv1,valorQRM3);
% graficarValoresIt(SolucJacobi3, SolucSei3, 'Aproximaciones sistema 4225');


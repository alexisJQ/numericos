clc
close all

% values
input_error = false;

% get parameters
min_foto = input("Ingrese el numero minimo de fotones: ");
max_foto = input("Ingrese el numero maximo de fotones: ");
sources = input("Ingrese la cantidad de fuentes a agregar (minimo 0; maximo 100): ");

% error control for inputs parameters
if min_foto < 50000
   disp("ERROR: el numero minimo de fotones no puede ser menor a 50000");
   input_error = true;
end

if max_foto > 10000000
   disp("ERROR: el numero maximo de fotones no puede ser mayor a 10000000");
   input_error = true;
end

if min_foto >= max_foto
   disp("ERROR: la cantidad de minima de fotones no puede ser mayos que la cantidad maxima");
   input_error = true;
end

if sources > 100 || sources < 0
    disp("ERROR: la cantidad de fuentes debe tomar valores entre 0 y 100");
    input_error = true;
end

% eje
if input_error == false
    % load data of the problem
    disp("Cargando la informacion espere unos segundos...");
    A = load('datos\A4225.dat');
    b = load('datos\b4225.dat');
    disp("Datos cargados de manera exitosa");
    
    fuentes(A, b, min_foto, max_foto, sources);
    mov_sen(A, b)
    
end
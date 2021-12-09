Trabajo realizado por Alexis Quintana, Pep2 Algoritmos Numericos
para la ejecución del programa, debido a la implementación del metodo LSQR para dispersas, la obtención de los videos tomara tiempo.
En caso de quere reducir dicho tiempo se puede hacer el cambio en el codigo de los archivos fuentes.m y mov_sen.m
dicho cambio consiste en reemplazar la lineas de codigo que digan "u = LSQR_opt(A, b)" por "u = linsolve(A, b)"
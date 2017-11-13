clear;
clc;

addpath('../stopping_criteria');

sela = [
  5 5 1
  1 9 4
  4 1 8
];

results = [ 2; 4; 5 ];

precisao = 10^-9;

% Define o critério de parada
% Veja os arquivos stop_by_*
should_stop = @(coef) stop_by_precision(sela, coef, results, precisao);

disp("Sistema Linear:");
disp(sela);
disp("Resultados:");
disp(results);
disp(["Precisão adotada: " num2str(precisao)]);

if (! diagonal_dominante(sela))
  disp("*********************************************************");
  disp("** ATENÇÃO: A Matriz não possui diagonal dominante!     *");
  disp("*********************************************************");
endif;

disp("===========================================");
disp("Jacobi:");

x = guess(size(results), 10);

disp("Guess:");
disp(x);

i = 0;

do
  old = x;
 
  x = jacobi(sela, results, x);
  
  i++;
until (i > 100 || should_stop(x));

disp(["Jacobi: finalizado após " num2str(i) " iterações."]);
disp("Resultado:");
disp(x);

%%
% Gauss-Seidel
%%

i = 0;

disp("===========================================");
disp("Gauss-Seidel:");

x = guess(size(results), 10);

disp("Guess:");
disp(x);

do
  old = x;
 
  x = gauss_seidel(sela, results, x);
  
  i++;
until (i > 100 || should_stop(x));

disp(["Gauss-Seidel: finalizado após " num2str(i) " iterações."]);
disp("Resultado:");
disp(x);
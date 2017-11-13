clear;
clc;

addpath('../stopping_criteria');

output_precision(16);
format long;

disp("Integrais");

% Stopping criteria config
precision   = 10^-6;
should_stop = @(old, new) stop_by_nvariation(old, new, precision); % Stopping func

disp(["Precisão adotada: " num2str(precision)]);

f = @(x) exp(x^2);
a = 0; % Interval start
b = 2; % Interval end

%%
% Método dos trapézios
%%

iter = 0;
npontos = 0;
A_trapezio = 0;

do
  iter++;
  npontos = iter + 1;
  A_old = A_trapezio;
  A_trapezio = trapezoidal_area(f, a, b, npontos);
until(iter != 1 && should_stop(A_old, A_trapezio));

disp(["Área pelo método dos trapézios: " num2str(A_trapezio) "u.a após " num2str(iter) " iterações e " num2str(npontos) " divisões."]);

%%
% Simpson I
%%

iter = 0;
npontos = 0;
A_simpson1 = 0;

do
  npontos = 3 + iter*2; % Impares maiores que 1
  A_old = A_simpson1;
  A_simpson1 = simpson_athird(f, a, b, npontos);
  iter++;
until(iter != 1 && should_stop(A_old, A_simpson1));

disp(["Área pelo método do 1/3 (Simpson I): " num2str(A_simpson1) "u.a após " num2str(iter) " iterações e " num2str(npontos) " divisões."]);


%%
% Simpson II
%%

iter = 0;
npontos = 0;
A_simpson2 = 0;

do
  npontos = 4 + iter*3;
  A_old = A_simpson2;
  A_simpson2 = simpson_ii(f, a, b, npontos);
  iter++;
until(iter != 1 && should_stop(A_old, A_simpson2));

disp(["Área pelo método do 3/8 (Simpson II): " num2str(A_simpson2) "u.a após " num2str(iter) " iterações e " num2str(npontos) " divisões."]);
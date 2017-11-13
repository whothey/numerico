clear;
clc;

output_precision(16);
format long;

disp("Ajuste de Curvas");

P = [
  1   1
  1.5 4
  2   6
  2.3 5
];

P = [
  -2     4.4
  -0.5   5.1
   1.2   3.2
   2.1   1.6
   3.5   0.1
   5.4  -0.4
];


X = P(:, 1);
Y = P(:, 2);

% Variance on X
dev = 0;

for i=2:size(X, 1)
  dev += (X(i-1) - X(i))/2;
endfor;

% Espaço de plotagem
% S = linspace(min(X) - dev, max(X) + dev)
S = linspace(min(X), max(X));


% Resposta
A = linear_regression(X, Y, 1);

disp("Resposta:");
disp(A);

figure(1);
plot(X, Y, '.r;Pontos da Amostra;');
title('Ajuste de Curvas');
hold on;
grid on;
plot(S, polyval(A, S), '-b;Curva ajustada;');
hold off;

disp(["DiffErro^2: " num2str(sqerror(Y, polyval(A, X)))]);
disp(["Coeficiente de Determinação (R²): " num2str(mse(Y, polyval(A, X)))]);
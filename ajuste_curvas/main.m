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

Yhat = polyval(A, X);
Yerr = Y + (Yhat - Y) / 2;

for i=1:size(Yerr, 1)
  text(X(i), Yerr(i), num2str(abs(Yhat(i) - Yerr(i))));
endfor;

ebars = errorbar(X, Yerr, (polyval(A, X) - Y) / 2, '~;Erros;');
set(ebars, "linestyle", "none");

plot(S, polyval(A, S), '-b;Curva ajustada;');
hold off;

disp(["DiffErro^2: " num2str(sqerror(Y, polyval(A, X)))]);
disp(["Coeficiente de Determinação (R²): " num2str(mse(Y, polyval(A, X)))]);
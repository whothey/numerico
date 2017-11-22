clear;
clc;

output_precision(16);
format long;

disp("Ajuste Linear Multiplo");

P = [
   55 100 550
   70  90 630
   90  80 720
  100  70 700
   90  70 625
  105  70 735
   80  70 560
  110  65 715
  125  60 750
  115  60 690
  130  55 715
  130  50 650
];

Y  = P(:, 1);
X1 = P(:, 2);
X2 = P(:, 3);

% Espaço de plotagem
% S = linspace(min(X) - dev, max(X) + dev)
SX = SY = linspace(min(X1, X2), max(X1, X2));

% Resposta
A = multiple_linear_regression(X1, X2, Y);

disp("Resposta:");
disp(A);

figure(1);
% mesh(X1, X2, Y, '.r;Pontos da Amostra;');
title('Ajuste de Curvas (Multiplo)');
hold on;
grid on;

data = [X1, X2, repmat([1], size(X1, 1), 1)];
Yhat = data * A;

%plot(S, polyval(A, [SX SY]), '-b;Curva ajustada;');
hold off;

disp(["DiffErro^2: " num2str(sqerror(Y, Yhat))]);
disp(["Coeficiente de Determinação (R²): " num2str(mse(Y, Yhat))]);
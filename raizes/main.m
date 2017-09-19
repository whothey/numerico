% Main File

clear;
clc;
output_precision(6);

% Define um intervalo
imin = 1.6;
imax = 2.3;
step = 0.001;

x = imin:step:imax;

% 2*x.^3 - 4*x.^2
polinomio = [ 2 -4 0 0 ];

% 2*x.^3 - 4*x.^2 + 4*x + 2;
% polinomio = [ 2 -4 4 2 ]

% Info
disp(["Função: " polyout(polinomio, 'x')]);
disp(["Derivada: " polyout(polyder(polinomio), 'x')]);
disp(["Intervalo: (" num2str(imin) ", " num2str(imax) ")"]);

f    = @(x) polyval(polinomio, x);
fder = @(x) polyval(polyder(polinomio), x);

[raiz, candidatas] = newton(f, fder, imin, imax);

disp(['Foram necessárias ' num2str(size(candidatas, 2)) ' iterações para achar a raíz']);

# Calcula Valores
y = f(x);

plot(x, y, "-b;Função;");
xlabel("x");
ylabel("y");
title("Newton");
grid on;
hold on;
plot(candidatas, f(candidatas), ".r;Raízes;");
plot(raiz, f(raiz), ".g;Raíz;");
hold off;
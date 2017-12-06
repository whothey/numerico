clear;
clc;

addpath('../stopping_criteria');

% output_precision(16);
format long;

disp("Equações Diferenciais");

maxiter = 1000;

% fn = @(x, y) x + y;
% fn = @(x, y) x - y + 2;
fn = @(x) x + x.^2;
analytic = @(x) (x.^2)/2 + (x.^3)/3;

x0 = 0;
y0 = 0;

% [a, b] discretized by n points
a = 0;
b = 1;
n = 11;

h = discretize(a, b, n);

X = a+h:h:b;

disp(1:n-1)

disp("Euler:");
eul = euler_method(a, b, n, x0, y0, fn);
disp(eul);

disp("Runge-Kutta 2a Ordem (Euler Melhorado):");
rk2 = runge_kutta_2nd(a, b, n, x0, y0, fn);
disp(rk2);

disp("Runge-Kutta 2a Ordem (Euler Modificado):");
rk2_2 = runge_kutta_2nd_2(a, b, n, x0, y0, fn);
disp(rk2_2);

disp("Runge-Kutta 3a Ordem:");
rk3 = runge_kutta_3rd(a, b, n, x0, y0, fn);
disp(rk3);

disp("Runge-Kutta 4a Ordem:");
rk4 = runge_kutta_4th(a, b, n, x0, y0, fn);
disp(rk4);

figure(1);

plot(linspace(a, b), analytic(linspace(a,b)), "-b;Solução Analítica;");

hold on;
grid on;

plot([x0 X], [y0 eul], ".r;Euler;");
plot([x0 X], [y0 rk2], "og;Euler Melhorado;");
plot([x0 X], [y0 rk2_2], "vb;Euler Modificado;");
plot([x0 X], [y0 rk3], "pc;Runge-Kutta 3a Ordem;");
plot([x0 X], [y0 rk4], "dm;Runge-Kutta 4a Ordem;");
hold off;
clear;
clc;

output_precision(16);
format long;

disp("Interpolação");

P = [
  0 1
  2 5
  3 7
  6 21
  8 12
];

%#{
P = [
  10   227.04        
  15   362.78        
  20   517.35        
  22.5 602.97
];
%#}

#{
P = [
  1 40
  3 47
  5 53
  7 55
];
#}

P = [
  0   1
  0.5 0.1353352
  1   0.0183156
  1.5 0.0024787
  2.3 0.0001010
];


% Ponto a ser interpolado
%x = 5;
%x = 16;
% x = 4;
x = [0 0.5 0.7 1 1.3 1.5 1.6 1.9 2.3]

X     = P(1:end, 1);
Y     = P(1:end, 2);
plotx = min(X):0.01:max(X);

%%%%%%%%%%%%%%%%%%%%%%%%%%%
% La Granje
%%%%%%%%%%%%%%%%%%%%%%%%%%%

y = lagrange(P, x);

disp("Resposta La Grange:");
disp([x, y]);

figure(1);
plot(X, Y, '-k;Ligação dos Pontos Originais;', X, Y, '.b;Pontos Originais;');
title("La Granje");
hold on;
grid on;

ploty = lagrange(P, plotx);

plot(plotx, ploty, '-b;Ligação dos Pontos com La Grange;', x, y, '.r;Ponto Interpolado;');
hold off;

%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Diferenças Divididas
%%%%%%%%%%%%%%%%%%%%%%%%%%%

dds = divided_differences(P);
y   = dd_polinomio_interpolador(dds, P, x);

disp("Resposta Diferenças Divididas:");
disp([x, y]);

figure(2);
plot(X, Y, '-k;Ligação dos Pontos Originais;', X, Y, '.b;Pontos Originais;');
title("Diferenças Divididas");
hold on;
grid on;

ploty = dd_polinomio_interpolador(dds, P, plotx);

plot(plotx, ploty, '-b;Função do Polinômio Interpolador;', x, y, '.r;Ponto Interpolado;');
hold off;

%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Diferenças Finitas
%%%%%%%%%%%%%%%%%%%%%%%%%%%

fds = finite_differences(P);
y   = fd_polinomio_interpolador(fds, P, x);

disp("Resposta Diferenças Finitas:");
disp([x, y]);

figure(3);
plot(X, Y, '-k;Ligação dos Pontos Originais;', X, Y, '.b;Pontos Originais;');
title("Diferenças Finitas");
hold on;
grid on;

ploty = fd_polinomio_interpolador(fds, P, plotx);

plot(plotx, ploty, '-b;Função do Polinômio Interpolador;', x, y, '.r;Ponto Interpolado;');
hold off;
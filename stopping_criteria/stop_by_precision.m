% Critério de Parada:
% Pela diferença dos resultados encontrados e do resultado conhecido
%
% M = Matriz
% c = Coficientes Encontrados
% r = Resultados
function done=stop_by_precision(M, c, r, precision=10^-6)
  done = abs(M * c - r) < precision;
endfunction;
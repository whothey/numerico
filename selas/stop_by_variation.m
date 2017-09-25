% Critério de Parada:
% Pela diferença do resultado anterior em relação ao atual
% (Ou, quando a melhora da iteração não é significante dada a precisão)
%
% old = Coeficientes anteriores
% current = Coficientes Atuais
function done=stop_by_variation(old, current, precision=10^-6)
  done = abs(old - current) < precision;
endfunction;
% Critério de Parada:
% Pela diferença do resultado anterior em relação ao atual [NORMALIZADO]
% (Ou, quando a melhora da iteração não é significante dada a precisão)
%
% old = Coeficientes anteriores
% current = Coficientes Atuais
function done=stop_by_nvariation(old, current, precision=10^-6)
  done = abs(old - current) / abs(current) < precision;
endfunction;
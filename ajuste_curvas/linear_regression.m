% Regressão linear / Ajuste de Curvas
% dg = Grau
function R=linear_regression(X, Y, dg = 1)
  A = ones(size(X, 1), dg + 1);
  
  for i=1:size(X, 1)
    for j=1:dg
      A(i, j) = X(i).^(dg-j+1);
    endfor;
  endfor;
  
  R = inv(A' * A) * A' * Y;
endfunction;

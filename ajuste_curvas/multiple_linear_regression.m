% Regressão linear / Ajuste de Curvas
% dg = Grau
function R=multiple_linear_regression(X, Y, Z, dg = 1)
  A = ones(size(X, 1), dg + 2);
  A(:, 1) = X;
  A(:, 2) = Y;
  
  R = inv(A' * A) * A' * Z;
endfunction;

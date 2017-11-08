% Regressão linear / Ajuste de Curvas
% dg = Grau
function R=linear_regression(X, Y, dg = 1)
  A = ones(size(X, 1), dg + 1);
  
  for i=1:size(X, 1)
    for j=1:dg
      %disp(["Doing " num2str(X(i)) "^" num2str(dg-j+1) " to (" num2str(i) ',' num2str(j) ')']);
      A(i, j) = X(i).^(dg-j+1);
    endfor;
  endfor;
  
  R = inv(A' * A) * A' * Y;
endfunction;

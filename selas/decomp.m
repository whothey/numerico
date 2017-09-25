% Decompose Matrices

function [L, D, U]=decomp(M)
  L = tril(M, -1);
  D = diag(diag(M));
  U = triu(M, 1);
endfunction;
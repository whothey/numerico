% Gauss-Seidel

function x=gauss_seidel(mat, results, x = [])

  % Initialize x responses
  if (size(x) == 0)
    x = rand(size(results)) * 20;
  endif;
  
  sizes = size(mat);
  
  [L, D, U] = decomp(mat);
  
  ldinv = inv(L + D);
  
  x = ldinv * results - ldinv * U * x;

endfunction;

function [L, D, U]=decomp(M)
  L = tril(M, -1);
  D = diag(diag(M));
  U = triu(M, 1);
endfunction;

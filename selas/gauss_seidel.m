% Gauss-Seidel

function x=gauss_seidel(mat, results, x = [])

  % Initialize x responses
  if (size(x) == 0)
    x = guess(size(results));
  endif;
  
  [L, D, U] = decomp(mat);
  
  ldinv = inv(L + D);
  
  x = ldinv * results - ldinv * U * x;

endfunction;

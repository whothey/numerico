% Jacobi

function x=jacobi(mat, results, x = [])

  % Initialize x responses
  if (size(x) == 0)
    x = rand(size(results)) * 20;
  endif;
  
  x = results - (mat - eye(size(results, 1))) * x;

endfunction;

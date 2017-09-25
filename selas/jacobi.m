% Jacobi

function x=jacobi(mat, results, x = [])

  % Initialize x responses
  if (size(x) == 0)
    x = rand(size(results)) * 20;
  endif;
  
  [L, D, U] = decomp(mat);
  
  % Versão copiada do quadro, não ok: 
  % x = results - (mat - eye(size(results, 1))) * x;

  x = inv(D) * ((-L - U) * x + results);

endfunction;

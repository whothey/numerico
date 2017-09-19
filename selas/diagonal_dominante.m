% Verifica se a diagonal é dominante

function r=diagonal_dominante(mat)
  r = true;
  
  for i = 1:size(mat, 1)
    for j = 1:size(mat, 2)
      
      if (i != j && abs(mat(i, j)) >= abs(mat(j, j)))
        r = false;
        return;
      endif;
      
    endfor;
  endfor;
endfunction;
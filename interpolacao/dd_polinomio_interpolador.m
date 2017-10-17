
% Polinômio Interpolador
function y=dd_polinomio_interpolador(dds = [], P, x)
  if (size(dds) == [0 0])
    dds = divided_differences(P);
  endif;
  
  X  = P(:, 1)';
  n  = size(P, 1);
  np = n - 1;

  y = dds(1, 1);
  
  for i=2:n
    prods = dds(i, i);
    
    for j=1:i-1
      prods = prods .* (x - X(j));
    endfor;
    
    y += prods;
  endfor;

endfunction;
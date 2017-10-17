% La-Grange

function y=lagrange(P, x)
  degree = size(P, 1);
  y = 0;
  X = P(1:end, 1);
  Y = P(1:end, 2);

  for i=1:degree
    prod = 1;
    
    for j=1:degree
      if (j != i)
        prod = prod .* (x - X(j)) / (X(i) - X(j));
      endif;
    endfor;
    
    y += Y(i) .* prod;
  endfor;
  
endfunction;

% Bissecao

function [root, roots]=bissecao(f, low, high, precision=10^-6)
  roots = [];
  
  do
    
    root  = (low + high)/2;
    roots = [roots root];
    
    if (sign(f(root)) == sign(f(low)))
      low = root;
    else
      high = root;
    endif;
    
  until (abs(f(root)) < precision);
 
endfunction

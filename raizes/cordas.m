% Cordas

function [root, roots]=cordas(f, low, high, precision=10^-6)
  roots = [];
  
  do 
    
    signal = sign(f(low) * f(high));
    
    if (signal < 0)
      high = root = corda(f, low, high);
    else
      low  = root = corda(f, low, high);
    endif;
    
    roots = [roots root];
    
  until (abs(f(root)) < precision);
  
endfunction;

% Calcula uma corda
function corda_raiz=corda(f, low, high)
  corda_raiz = (low * f(high) - high * f(low)) / (f(high) - f(low));
endfunction;

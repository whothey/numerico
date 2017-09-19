% Método de Newton

% f: Function
% fder: Derivative of f
function [root, roots]=newton(f, fder, low, high, precision=10^-6)
  
  roots = [];
  
  do
    
    signal = sign(f(low) * f(high));
    
    if (signal > 0)
      high = root = high - f(high) / fder(high);
    else
      low  = root = low  - f(low) / fder(low);
    endif;
    
    roots = [roots root];
    
  until (abs(f(root)) < precision);
  
endfunction;

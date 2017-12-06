% [a, b] are the range to calculate the diferential
% x0 of diferential equation
% y0 of diferential equation
% n  is the number of points to discretize
function y=euler_method(a, b, n, x0, y0, der)
  y = zeros(1, n-1);
  h = discretize(a, b, n);
  
  for i=0:n-2
    if (i == 0)
      xi = x0;
      yi = y0;
    else
      xi = x0 + i*h;
      yi = y(i);
    endif;
    
    y(i + 1) = h * der(xi, yi) + yi;
  endfor;
endfunction;

% [a, b] are the range to calculate the diferential
% x0 of diferential equation
% y0 of diferential equation
% n  is the number of points to discretize
% "Euler Modificado"
function y=runge_kutta_3rd(a, b, n, x0, y0, dydx)
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
    
    k1 = dydx(xi, yi);
    k2 = dydx(xi + h/2, yi + h/2 * k1);
    k3 = dydx(xi + h, yi + 2*h*k2 - h*k1);
    
    y(i + 1) = yi + h/6 * (k1 + 4*k2 + k3);
  endfor;
endfunction;

% Método dos trapézios
% Trapezoidal
% n = number of divisions
function A=trapezoidal_area(f, a, b, n)
  h = deltaX(a, b, n);
  
  middle_terms = 0;
  
  for i=1:n-2
    middle_terms += f(a + i * h);
  endfor;

  % Trapezoidal Area
  A = h/2 * (f(a) + 2*middle_terms + f(b));
endfunction;

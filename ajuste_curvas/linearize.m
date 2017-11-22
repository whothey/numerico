% Lineariza uma função do tipo y = a*x ou y = a*e^(bx)
function [Y, A, X]=linearize(y, a, x)
  A = log(a);
  Y = log(y);
  X = log(x);
endfunction;

function [Y, A, X]=delinearize(y, a, x)
  A = exp(a);
  Y = exp(Y);
  X = exp(X);
endfunction;

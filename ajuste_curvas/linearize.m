% Lineariza uma função do tipo a = y*x
function [A, Y, X]=linearize(a, y, x)
  A = log(a);
  Y = log(y);
  X = log(x);
endfunction;
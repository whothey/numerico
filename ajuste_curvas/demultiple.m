% Ajuste Linear Multiplo
% Transforma
%   ax + by + cz + d = 0
% em
%   Z = Ax + By + C
function [A, B, C]=demultiple(a, b, c, d)
  A = -a/c;
  B = -b/c;
  C = -d/c;
endfunction;

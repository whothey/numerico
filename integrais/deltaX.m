% Calculate DeltaX or how much X must vary to get n divisions
% the spacing between
%
% a is where the interval starts
% b is where it ends
% n is the number of divisions
function dx=deltaX(a, b, n)
  dx = (b - a) / (n - 1) ; % fx based on n
endfunction;

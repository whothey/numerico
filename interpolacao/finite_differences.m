% Diferenças Finitas

function fds=finite_differences(P)
  X = P(1:end, 1);
  Y = P(1:end, 2);
  
  n   = size(P, 1);
  fds = zeros(n);
  fds(:, 1) = Y';
  
  for j=2:n   % ny
    for i=n-j+2:-1:2 % order
      fds(i-1, j) = fds(i, j-1) - fds(i-1, j-1);
      % disp(['(' num2str(i) ',' num2str(j) '): ' num2str(fds(i-1, j)) ' = ' num2str(fds(i, j-1)) ' - ' num2str(fds(i-1, j-1)) ]);
    endfor;
  endfor;
  
endfunction;

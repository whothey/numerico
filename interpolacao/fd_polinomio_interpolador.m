% Polinômio Interpolador Diferenças Finitas
function y=fd_polinomio_interpolador(fds = [], P, x)
  if (size(fds) == [0 0])
    fds = finite_differences(P);
  endif;
  
  X  = P(:, 1)';
  
  h = mean(diff(X)); % Gambi para aproximação, se não só X(2) - X(1)
  z = (x - X(1)) / h;

  n  = size(P, 1);
  np = n - 1;

  y  = fds(1, 1);
  
  for i=2:n
    prods = fds(1, i) / factorial(i-1);
    
    # disp([num2str(fds(1, i)) " / " num2str(i-1) "! = " num2str(fds(1,i) / factorial(i-1))]);
    
    for j=0:i-2
      # disp([num2str(z) " - " num2str(j) " = " num2str(z - j)]);
      prods = prods .* (z - j);
    endfor;
    
    y += prods;
  endfor;

endfunction;
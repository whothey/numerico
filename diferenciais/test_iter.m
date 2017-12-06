
function test_iter(ode_solver, precision)
  old = ode_solver(2);
  
  for i=2:100000
    npoints = i+1;
    current = ode_solver(npoints)(end);
    delta = current - old;
    
    if (delta < precision)
      disp([num2str(precision ) " precision achieved with " num2str(npoints) " points and " num2str(i) " iteractions"]); 
      return
    endif
    
    old = current;
  endfor;
  
  disp(["Max iter achieved"]);
endfunction;
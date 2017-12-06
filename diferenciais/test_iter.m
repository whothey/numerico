
function test_iter(ode_solver, precision)
  old = ode_solver(2);
  
  for i=2:100000
    npoints = i+1;
    current = ode_solver(npoints);
    
    if (current - old < precision)
      disp([precision "precision achieved with" npoints "points, with " i "iteractions"]); 
      return
    endif
    
    old = current;
  endfor;
endfunction;
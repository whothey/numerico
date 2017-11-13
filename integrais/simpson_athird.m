function A=simpson_athird(f, a, b, n)
  h = deltaX(a, b, n);
  
  middle_terms = 0;
  
  for i=1:n-2
    if (mod(i, 2) == 1)
      middle_terms += 4 * f(a + i * h);
    else
      middle_terms += 2 * f(a + i * h);
    endif;
  endfor;
  
  A = h/3 * (f(a) + middle_terms + f(b));
endfunction;

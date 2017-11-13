function A=simpson_ii(f, a, b, n)
  h = deltaX(a, b, n);
  
  middle_terms = 0;
  
  for i=1:n-2
    if (mod(i, 3) > 0)
      middle_terms += 3 * f(a + i * h);
    else
      middle_terms += 2 * f(a + i * h);
    endif;
  endfor;
  
  A = h*3/8 * (f(a) + middle_terms + f(b));
endfunction;

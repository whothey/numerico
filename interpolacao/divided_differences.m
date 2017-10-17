% Diferenças Divididas

% dds(i, ordem);
function dds=divided_differences(P, x)
  % o = line + 1,  and 'o' is the order of DD, columns the indice of point Y
  X   = P(:, 1)';
  Y   = P(:, 2)';
  n   = size(P, 1);
  np  = n - 1;
  dds = zeros(n);
  dds(:, 1) = Y;
  
  for i=1:np
    for j=1:i
      dds(i+1,j+1) = (dds(i+1,j)-dds(i,j)) / (X(i+1)-X(i-j+1));
    end;
  end;

endfunction;
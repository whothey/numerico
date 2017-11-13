% "Squared Error"
function E=sqerror(Y, Yhat)
  E = sum(pow2(Yhat - Y));
endfunction;
  
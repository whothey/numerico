% "Mean Squared Error", ou, no caso, método dos mínimos quadrados
function E=mse(Y, Yhat)
  E = sum(pow2(Yhat - Y));
endfunction;
  
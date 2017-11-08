% Coeficiente de Determinação
function R2=coef_determination(Y, Yhat)
  R2 = 1 - (mse(Y, Yhat) / mse(Y, mean(Y))); 
endfunction;

% Coeficiente de Determinação (R2)
% Mean Squared Error
% No caso, método dos mínimos quadrados
function R2=mse(Y, Yhat)
  R2 = 1 - (sqerror(Y, Yhat) / sqerror(Y, mean(Y))); 
endfunction;

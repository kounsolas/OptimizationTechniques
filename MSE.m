function mse = MSE(f_value,gaussian_value)

%ypotheto oti doulebei sosta
mse = abs((f_value-gaussian_value)^2);
end
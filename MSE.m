function mse = MSE(values,f_aprox,u1,u2)

syms x y

approximate_val = double(subs(f_aprox,{x,y},{u1,u2}));
mse = abs((values-approximate_val).^2);


end
function mse = MSE(f_values,gaussian_values)
%receives the values of the real function and the values of 1 of the 100 of the gaussians

%f_values is a 40x40 matrix
%gaussian_values is a 40x40 matrix
%ypotheto oti doulebei sosta

mse = 0;
for i=1:size(f_values,1)
    for j=1:size(f_values,1)
        mse =mse + (f_values(i,j) - gaussian_values(i,j));
    end
end

mse = mse/(25^2);


%p = sum(sum(mse)); 

%Summarize the columns first and then takes the sum of the whole SINGLE column
%This is a measure to define which of the chromosomes is the best for
%selection

end
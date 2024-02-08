function [fitness_value] = bestfitness(population,chromosomes)


mse_values = zeros(1,population);

for i=1:population
    mse_values(i) = MSEcalculation(chromosomes(i,:));%MSE(f_values,gaussian_values);

end

fitness_value = 10./(1+mse_values); 





end




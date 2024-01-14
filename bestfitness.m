function mse_values = bestfitness(f_values,population,chromosomes,u1,u2)

% f_values 40x40 matrix
% gaussian_values 40x40 matrix
%i generate_gaussian pairnei san orismata ola ta x kai ola ta y kai epistefei tis times enos xromosomatos apo ta 100 gia kathe syndyasmo simeion


mse_values = zeros(1,population);

for i=1:population
    gaussian_values = generateGaussian(chromosomes(i,:),u1,u2);
    mse_values(i) = MSE(f_values,gaussian_values);

end


%{
chromosome_worth = zeros(1,population);
for i=1 : population
    chromosome_values = generateGaussian(chromosomes(i,:),u1,u2);
    chromosome_rounded_values = round(chromosome_values,4);
    f_rounded_values = round(f_values,4);
    comparison_matrix = (chromosome_rounded_values == f_rounded_values);
    chromosome_worth(i) = length(find(comparison_matrix));

end
%}

end



function new_generation = intermediateCrossover(selectedChromosomes)
    [population_size, chromosome_size] = size(selectedChromosomes);
    new_generation = zeros(population_size, chromosome_size);

    for i = 1:population_size
        parent1 = selectedChromosomes(i, :);
        parent2 = selectedChromosomes(randi(population_size), :);

        % Intermediate recombination
        new_generation(i, :) = (parent1 + parent2) / 2;
    end
end
%{
function offspring = intermediateCrossover(chromosomes,population,crossover_rate)
    % Perform crossover between two parents to create one or more offspring
    
    % Default crossover rate is 0.7 if not provided
    if nargin < 3
        crossover_rate = 0.7;
    end
    a = randi(population);
    b = randi(population);
    if a==b
        b= randi(population);
        parent1=chromosomes(a,:);
        parent2 = chromosomes(b,:);
    else
        parent1=chromosomes(a,:);
        parent2 = chromosomes(b,:);
    end

    % Initialize offspring
    offspring = zeros(size(parent1));

    % Check if crossover should occur based on the crossover rate
    if rand() < crossover_rate
        % Choose a random crossover point
        crossover_point = randi([1, min(length(parent1), length(parent2)) - 1]);

        % Create offspring by combining the genes of the parents
        offspring(1:crossover_point) = parent1(1:crossover_point);
        offspring(crossover_point+1:end) = parent2(crossover_point+1:end);
    else
        % If no crossover occurs, simply copy the parents as offspring
        offspring = parent1;
    end
end
%}

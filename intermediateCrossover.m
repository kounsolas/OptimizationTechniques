function new_generation = intermediateCrossover(selectedChromosomes)

%population size = 100 chromosome size = 75
    [population_size, chromosome_size] = size(selectedChromosomes);
    new_generation = zeros(population_size, chromosome_size);

    for i = 1:population_size
        parent1 = selectedChromosomes(i, :);
        parent2 = selectedChromosomes(randi(population_size), :);

        % Intermediate recombination
        new_generation(i, :) = (parent1 + parent2) / 2;
    end
end

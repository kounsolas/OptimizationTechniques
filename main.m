clear;

tic
syms x y


u1 = linspace(-1,2,25);
u2 = linspace(-2,1,25);
[U1,U2] = meshgrid(u1,u2);
f_values = double(f(u1,u2));


maxgenerations = 1000;
population = 200;
numberOfGaussians = 15;
genomesize = 5*numberOfGaussians;

first_gen = zeros(population,genomesize);

for i=1:population
    first_gen(i,:) = generateChromosome(genomesize);
end

offsprings = intermediateCrossover(first_gen,f_values,population,u1,u2);
new_generation = mutation(offsprings,population);

[fitness_value,index] = max(bestfitness(f_values,population,new_generation,u1,u2));
err(1) = fitness_value;
bestFit(1,:) = new_generation(index,:);

generation = 1;
while(true)
    if (generation > maxgenerations || fitness_value <= 0.005)
        break;
    else
        generation
        offsprings = intermediateCrossover(new_generation,f_values,population,u1,u2);
        new_generation = mutation(offsprings,population);
        [fitness_value,index] = max(bestfitness(f_values,population,new_generation,u1,u2));
        bestFit(generation+1,:) = new_generation(index,:);
        err(generation+1) = fitness_value;
        generation = generation + 1;
    end
end

plot(1:generation,err);
best = bestfitness(f_values,population,new_generation,u1,u2);


[~,index] = max(best);

best_chromosome=new_generation(index,:);

best_function = fittingFunction(best_chromosome);

[X, Y] = meshgrid(u1, u2);
best_values = double(subs(best_function, {x, y}, {X(:), Y(:)}));
best_values = reshape(best_values, size(X));
    
   
figure()
fsurf(best_function,[-1 2 -2 1])
colorbar


%BALE KANE SXOLIO PALIO MALAKA

%xreiazomai
%genetic representation of a solution (chromosomes)
%a function to generate new solutions 
%fitness function
%selection function
%crossover function
%mutation functions

clear;
clc;
tic
maxgenerations = 100;
population = 100; %arithmos pithanon lyseon(list of chromosomes), diladi
    % arithmos ton pithanon synartiseon pou paragontai apo syndyasmous ton 15 gaussian
numberofGaussians = 15;
chromosomesize = numberofGaussians*5; %καθε gaussian exei 5 stoixeia kai to genome
    %apoteleitai max 15 gaussians ara genomesize = 75
err = zeros(1,maxgenerations);
syms x y
f(x, y) = sin(x + y) * sin(y^2);
u1 = linspace(-1, 2, 25);
u2 = linspace(-2, 1, 25);
    
% Create a grid of values for u1 and u2
[U1, U2] = meshgrid(u1, u2);
% Evaluate the function over the grid
f_values = double(f(U1, U2));

 %each specimen in our population has a genome that encodes the solution
    
    
chromosomes = zeros(population,chromosomesize); %100x75
    
%arxikopoio ta chromosomes
%GENERATION 0 
for i=1:population
  chromosomes(i,:) = generateChromosome(chromosomesize);
  %kathe grammi einai mia f
end


a = selection(f_values,population,chromosomes,u1,u2);
crossovers = intermediateCrossover(a);
mutated = mutation(a,population); 
gamatoi = [crossovers;mutated];
n = population-size(gamatoi,1);
beta_males = zeros(n,chromosomesize);
for j=1:n
    beta_males(j,:) = generateChromosome(chromosomesize);
    %kathe grammi einai mia f
end
    

new_generation=[gamatoi;beta_males];
  


for i=1:maxgenerations
  
    i

    a = selection(f_values,population,new_generation,u1,u2);
    crossovers = intermediateCrossover(a);
    mutated = mutation(a,population);
    gamatoi = [crossovers;mutated];
    n = population-size(gamatoi,1);
    beta_males = zeros(n,chromosomesize);
    for j=1:n
        beta_males(j,:) = generateChromosome(chromosomesize);
        %kathe grammi einai mia f
    end
    

    new_generation=[gamatoi;beta_males];

    %brisko se kathe genia to kalytero (DEBUGGING)
    best = bestfitness(f_values,population,new_generation,u1,u2);
    [~,index] = max(best);
    best_chromosome_generations(i,:)=new_generation(index,:);
    err(i) = MSE(f_values,generateGaussian(best_chromosome_generations(i,:),u1,u2));
    

end





best = bestfitness(f_values,population,new_generation,u1,u2);


[~,index] = max(best);

best_chromosome=new_generation(index,:);

best_function = fittingFunction(best_chromosome);

[X, Y] = meshgrid(u1, u2);
best_values = double(subs(best_function, {x, y}, {X(:), Y(:)}));
best_values = reshape(best_values, size(X));
    
   

fsurf(best_function,[-1 2 -2 1])
colorbar
figure

fsurf(f,[-1 2 -2 1])
colorbar



toc



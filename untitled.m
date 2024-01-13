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
maxgenerations = 1000;
population = 100; %arithmos pithanon lyseon(list of chromosomes), diladi
    % arithmos ton pithanon synartiseon pou paragontai apo syndyasmous ton 15 gaussian
numberofGaussians = 15;
chromosomesize = numberofGaussians*5; %καθε gaussian exei 5 stoixeia kai to genome
    %apoteleitai max 15 gaussians ara genomesize = 75

syms x y
f(x, y) = sin(x + y) * sin(y^2);
u1 = linspace(-1, 2, 40);
u2 = linspace(-2, 1, 40);
    
% Create a grid of values for u1 and u2
[U1, U2] = meshgrid(u1, u2);
% Evaluate the function over the grid
f_values = double(f(U1, U2));

 %each specimen in our population has a genome that encodes the solution
    
    
chromosomes = zeros(population,chromosomesize); %100x75
    
%arxikopoio ta genome
%GENERATION 0 
for i=1:population
  chromosomes(i,:) = generateChromosome(chromosomesize);
  %kathe grammi einai mia f
end


for i=1:maxgenerations
  
    
    a = selection(f_values,population,chromosomes,u1,u2);
    crossovers = crossover(a);
    mutated = mutation(a);
    gamatoi = [crossovers;mutated];
    
    for j=1:(population-size(gamatoi,1))
        beta_males(j,:) = generateChromosome(chromosomesize);
        %kathe grammi einai mia f
    end
    
    new_generation=[gamatoi;beta_males];
end



for i=1:population
    gaussian_values = generateGaussian(chromosomes(i,:),u1,u2);
    best(i) = MSE(f_values,gaussian_values);
end

[~,index] = min(best);

best_chromosome=chromosomes(index,:);

best_function = fittingFunction(best_chromosome);


    
   

fsurf(f_aprox)
colorbar
figure
fsurf(f)
colorbar


toc



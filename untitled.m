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


crossovers = crossover(chromosomes,population,f_values,u1,u2);
new_generation = mutation(crossovers,population);




best = bestfitness(f_values,population,new_generation,u1,u2);
[~,index] = max(best);
best_chromosome_generations(1,:)=new_generation(index,:);
err(1) = MSE(f_values,generateGaussian(best_chromosome_generations(1,:),u1,u2));
    


  


for i=1:maxgenerations
  
    i
   
        a = crossover(new_generation,population,f_values,u1,u2);
        new_generation = mutation(a,population);
    
    
        disp('ΓΙΑΤΙ ΕΙΣΑΙ ΒΛΑΜΜΕΝΟ??????????')
      
    
        %brisko se kathe genia to kalytero (DEBUGGING)
        best = bestfitness(f_values,population,new_generation,u1,u2);
        [~,index] = max(best);
        best_chromosome_generations(i+1,:)=new_generation(index,:);
        err(i+1) = MSE(f_values,generateGaussian(best_chromosome_generations(i+1,:),u1,u2));
    
    

end





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
figure()

fsurf(f,[-1 2 -2 1])
colorbar



toc



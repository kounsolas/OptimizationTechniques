clear;
clc;
tic
maxgenerations = 1000;
population = 100; 
numberofGaussians = 15;
chromosomesize = numberofGaussians*5; 
err = zeros(maxgenerations,1);

syms u1 u2
f(u1,u2) = sin(u1+u2)*sin(u2^2);


    
    
chromosomes = zeros(population,chromosomesize); %100x75
    

for i=1:population
  chromosomes(i,:) = generateChromosome(chromosomesize);
  
end


crossovers = intermediateCrossover(chromosomes,population);
new_generation = mutation(crossovers,population);


    


  


for i=1:maxgenerations
  
         i
   
        crossovers = intermediateCrossover(new_generation,population);
        new_generation = mutation(crossovers,population);
      
        best = bestfitness(population,new_generation);
        [~,index] = max(best);
        best_chromosome_generations(i,:)=new_generation(index,:);
        err(i) = MSEcalculation(best_chromosome_generations(i,:));
     

end





best = bestfitness(population,new_generation);


[~,index] = max(best);

best_chromosome=new_generation(index,:);

best_function = fittingFunction(best_chromosome);


    
   
figure()
fsurf(best_function,[-1 2 -2 1])
colorbar

figure()
fsurf(f,[-1 2 -2 1])
colorbar

figure
plot(1:maxgenerations,err)




toc



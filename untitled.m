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
syms x y
f(x, y) = sin(x + y) * sin(y^2);

u1 = linspace(-1, 2, 10);
u2 = linspace(-2, 1, 10);

% Create a grid of values for u1 and u2
[U1, U2] = meshgrid(u1, u2);

% Evaluate the function over the grid
f_values = double(f(U1, U2));



maxgenerations = 1000;
population = 100; %arithmos pithanon lyseon(list of chromosomes), diladi
% arithmos ton pithanon synartiseon pou paragontai apo syndyasmous ton 15 gaussian
numberofGaussians = 15;
chromosomesize = numberofGaussians*5; %καθε gaussian exei 5 stoixeia kai to genome
%apoteleitai max 15 gaussians ara genomesize = 75

%each specimen in our population has a genome that encodes the solution


chromosomes = zeros(population,chromosomesize); %100x75

%arxikopoio ta genome
%GENERATION 0 
for i=1:population
    chromosomes(i,:) = generateChromosome(chromosomesize);
    %kathe grammi einai mia f
end


%a = bestfitness(population,chromosomes,u1,u2,f_values);
crossovers = crossover(chromosomes);
mutated = mutation(chromosomes);
new_generation = [crossovers;mutated];
toc


%{
fsurf(f_aprox)
colorbar
figure
fsurf(f_aprox-sin(x+y)*sin(y^2))
colorbar
%}


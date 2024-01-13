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

u1 = linspace(-1,2,100);
u2 = linspace(-2,1,100);
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
end



new = crossover(chromosomes);

toc


%{
fsurf(f_aprox)
colorbar
figure
fsurf(f_aprox-sin(x+y)*sin(y^2))
colorbar
%}


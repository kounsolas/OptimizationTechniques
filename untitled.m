clear;
clc;
tic
syms x y

u1 = linspace(-1,2,100);
u2 = linspace(-2,1,100);
maxgenerations = 1000;
population = 100;
numberofGaussians = 15;
genomesize = numberofGaussians*5;


chromosomes = zeros(population,genomesize);

for i=1:population
    chromosomes(i,:) = generateChromosome(genomesize);
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


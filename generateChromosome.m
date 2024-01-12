function chromosome = generateChromosome(genomesize)

genes = zeros(1,genomesize);

for i = 1 : 5 : genomesize
    genes(i) =  -0.5 + (0.8-(-0.5))*rand; % const in front of gaussian
    genes(i+1) = 1 + (4-1)*rand; % expected value 1
    genes(i+2) = 1 + (3-1)*rand; % expected value 2
    genes(i+3) = 0.3 + (1-0.3)*rand; % variance 1
    genes(i+4) = 0.3 + (1-0.3)*rand; % variance 2
end
chromosome = genes;

end
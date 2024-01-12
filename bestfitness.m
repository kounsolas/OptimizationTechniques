function bestCandidates = bestfitness(population,chromosomes,u1,u2)

values = zeros(1,length(chromosomes));
for i=1:population
    f_approx = generateGaussian(chromosomes(i,:));
    values(i,:) = MSE(f(u1,u2),f_approx,u1,u2);
    
end

bestCandidates = selection(values,chromosomes);


end
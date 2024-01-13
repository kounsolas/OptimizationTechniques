function bestCandidates = bestfitness(population,chromosomes,u1,u2,f_values)
%kano evaluate me to mse kathe f

values = zeros(10,10);
   
for k=1:population    
    k
    for i=1:length(f_values)
        
        for j=1:length(f_values)
            values_gaussian(i,j) = generateGaussian(chromosomes(k,:),u1(i),u2(j));
            values(i,j) = MSE(f_values(i,j),values_gaussian(i,j));
        end
    end
end

    
bestCandidates = selection(values,chromosomes);


end
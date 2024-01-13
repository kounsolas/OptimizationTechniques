function mutated = mutation(selectedChromosomes)
% function to perform mutations on the 50 best candidates



mutatedChromosomes = selectedChromosomes;
for i=1:30

    prob = rand;
    if prob > 0.9
        %Perform a mutation
        p = randi(75);
        index(i) = i;
        switch mod(p,5)
    
            case 1
                mutatedChromosomes(i,p) = -0.5 + (0.8-(-0.5))*rand;
            case 2
                mutatedChromosomes(i,p) = 1 + (4-1)*rand;
            case 3
                mutatedChromosomes(i,p) = 1 + (3-1)*rand;
            case 4
                mutatedChromosomes(i,p) = 0.3 + (1-0.3)*rand;
            case 0
                mutatedChromosomes(i,p) = 0.3 + (1-0.3)*rand;
        end
    else
        index(i) = 0;
    
    end

end


k = index(find(index));
mutation = zeros(length(k),length(mutatedChromosomes(1,:)));
for i=1:length(k)
    mutation(i,:) = mutatedChromosomes(k(i),:);
end



    
mutated = mutation;
mutated=mutated(any(mutated,2),any(mutated,1));


end
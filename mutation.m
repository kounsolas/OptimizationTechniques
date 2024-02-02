%{
function mutated = mutation(selectedChromosomes,population)
% function to perform mutations on the population/2 best candidates



mutatedChromosomes = selectedChromosomes;
for i=1:round(population)

    prob = rand;
    
        %Perform a mutation
        p = randi(75);
        index(i) = i;
        switch mod(p,5)
    
            case 1
                mutatedChromosomes(i,p) = -0.5 + (0.8-(-0.5))*normrnd(0,1);
            case 2
                mutatedChromosomes(i,p) = 1 + (4-1)*normrnd(0,1);
            case 3
                mutatedChromosomes(i,p) = 1 + (3-1)*normrnd(0,1);
            case 4
                mutatedChromosomes(i,p) = 0.3 + (1-0.3)*normrnd(0,1);
            case 0
                mutatedChromosomes(i,p) = 0.3 + (1-0.3)*normrnd(0,1);
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
%}
function mutated = mutation(selectedChromosomes,population)
% function to perform mutations on the population



for i=1:population
    mutated_gene = randi(population);
    prob = rand;
    if prob < 0.1
        index(i) = i;
        for j = 1:5:75
            selectedChromosomes(mutated_gene,j)   = -0.5 + (0.8-(-0.5))*normrnd(0,1);
            selectedChromosomes(mutated_gene,j+1) = 1 + (4-1)*normrnd(0,1);
            selectedChromosomes(mutated_gene,j+2) = 1 + (3-1)*normrnd(0,1);
            selectedChromosomes(mutated_gene,j+3) = 0.3 + (1-0.3)*normrnd(0,1);
            selectedChromosomes(mutated_gene,j+4) = 0.3 + (1-0.3)*normrnd(0,1);
        %Perform a mutation
        end
    end
  

end
    
mutated = selectedChromosomes;


end



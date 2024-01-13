%pairnei san orisma ton pinaka 100x75 (chromosomes)
function new_generation = crossover(selectedChromosomes)


for i=1:30
    prob = rand;
    if prob > 0.5
        a = randi(50);
        b = randi(50);
        c =  randi(75);
        if c<=74
            if a == b
                b = randi(50);
         
                new1 = selectedChromosomes(a,1:c) ;
                new2 = selectedChromosomes(b,c+1:end);
                new_chromosome1(i,:) = [new1 new2];
                new_chromosome2(i,:) = [new2 new1];
            else
                new1 = selectedChromosomes(a,1:c) ;
                new2 = selectedChromosomes(b,c+1:end);
                new_chromosome1(i,:) = [new1 new2];
                new_chromosome2(i,:) = [new2 new1];
                
            end
        else
            continue
        end
    end
end

new_generation = [selectedChromosomes;new_chromosome1;new_chromosome2];
new_generation=new_generation(any(new_generation,2),any(new_generation,1));

end
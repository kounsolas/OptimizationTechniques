%pairnei san orisma ton pinaka 100x75 (chromosomes)
function new_generation = crossover(selectedChromosomes)


for i=1:30
    prob = rand;
   
    if prob > 0.5
        a = randi(size(selectedChromosomes,1));
        b = randi(size(selectedChromosomes,1));
        c =  randi(size(selectedChromosomes,2));
        if c<=(size(selectedChromosomes,2)-1)
            if a == b
                b = randi(size(selectedChromosomes,1));
         
                new_start1 = selectedChromosomes(a,1:c) ;
                new_finish1 = selectedChromosomes(a,c+1:end);
                new_start2 = selectedChromosomes(b,1:c);
                new_finish2 = selectedChromosomes(b,c+1:end);
                new_chromosome1(i,:) = [new_start1 new_finish2];
                new_chromosome2(i,:) = [new_start2 new_finish1];
            else
                new_start1 = selectedChromosomes(a,1:c) ;
                new_finish1 = selectedChromosomes(a,c+1:end);
                new_start2 = selectedChromosomes(b,1:c);
                new_finish2 = selectedChromosomes(b,c+1:end);
                new_chromosome1(i,:) = [new_start1 new_finish2];
                new_chromosome2(i,:) = [new_start2 new_finish1];
                
            end
        else
            continue
        end
    end
end

new_generation = [selectedChromosomes;new_chromosome1;new_chromosome2];
new_generation=new_generation(any(new_generation,2),any(new_generation,1));

end
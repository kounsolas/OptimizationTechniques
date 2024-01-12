function new_generation = crossover(chromosomes)

selectedChromosomes = selection(chromosomes);


for i=1:30
    prob = rand;
    if prob > 0.3
        a = randi(50);
        b = randi(50);
        c =  randi(75);
        if mod(c,5) == 0 && c<=70
            if a == b
                b = randi(50);
                gene1 = selectedChromosomes(a,c+1:c+5);
                gene2 = selectedChromosomes(b,c+1:c+5);
                new_gene1 = [gene1(1:2) gene2(3:5)];
                new_gene2 = [gene2(1:2) gene1(3:5)];
                selectedChromosomes(a,c+1:c+5) = new_gene1;
                selectedChromosomes(b,c+1:c+5) = new_gene2;
                new_chromosome1(i,:) = selectedChromosomes(a,:);
                new_chromosome2(i,:) = selectedChromosomes(b,:);
            else
                gene1 = selectedChromosomes(a,c+1:c+5);
                gene2 = selectedChromosomes(b,c+1:c+5);
                new_gene1 = [gene1(1:2) gene2(3:5)];
                new_gene2 = [gene2(1:2) gene1(3:5)];
                selectedChromosomes(a,c+1:c+5) = new_gene1;
                selectedChromosomes(b,c+1:c+5) = new_gene2;
                new_chromosome1(i,:) = selectedChromosomes(a,:);
                new_chromosome2(i,:) = selectedChromosomes(b,:);
                
            end
        else
            continue
        end
    end
end



new_generation = [selectedChromosomes;new_chromosome1;new_chromosome2];


end
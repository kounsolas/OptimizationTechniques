%pairnei san orisma ta kalytera population/2x75 (chromosomes)
function new_generation = crossover(chromosomes,population,f_values,u1,u2)
%{
selectedChromosomes = selection(f_values,population,chromosomes,u1,u2);
for i=1:50
  
        a = randi(size(selectedChromosomes,1));
        b = randi(size(selectedChromosomes,1));
                j=1;
                for element=1:5:size(selectedChromosomes,2)
                    all_alphas_a(j) = selectedChromosomes(a,element);
                    all_alphas_b(j) = selectedChromosomes(b,element);

                    all_c1_a(j) = selectedChromosomes(a,element+1);
                    all_c1_b(j) = selectedChromosomes(b,element+1);

                    all_c2_a(j) = selectedChromosomes(a,element+2);
                    all_c2_b(j) = selectedChromosomes(b,element+2);

                    all_s1_a(j) = selectedChromosomes(a,element+3);
                    all_s1_b(j) = selectedChromosomes(b,element+3);

                    all_s2_a(j) = selectedChromosomes(a,element+4);
                    all_s2_b(j) = selectedChromosomes(b,element+4);

                    all_alphas_sorted = sort([all_alphas_a(j) all_alphas_b(j)],"descend");
                    new_alpha(j) = all_alphas_sorted(2) + rand*(all_alphas_sorted(1) - all_alphas_sorted(2)) + rand ;

                    all_c1_sorted = sort([all_c1_a(j) all_c1_b(j)],"descend");
                    new_c1(j) = all_c1_sorted(2) + rand*(all_c1_sorted(1) - all_c1_sorted(2))  + rand  ;
                    
                    all_c2_sorted = sort([all_c2_a(j) all_c2_b(j)],"descend");
                    new_c2(j) = all_c2_sorted(2) + rand*(all_c2_sorted(1) - all_c2_sorted(2)) + rand ;

                    all_s1_sorted = sort([all_s1_a(j) all_s1_b(j)],"descend");
                    new_s1(j) = all_s1_sorted(2) + rand*(all_s1_sorted(1) - all_s1_sorted(2)) + rand ;

                    all_s2_sorted = sort([all_s2_a(j) all_s2_b(j)],"descend");
                    new_s2(j) = all_s2_sorted(2) + rand*(all_s2_sorted(1) - all_s2_sorted(2)) + rand ;

                    j=j+1;

                end

                j=1;
                for k=1:5:75
                    element(k) = new_alpha(j);
                    element(k+1) = new_c1(j);
                    element(k+2) = new_c2(j);
                    element(k+3) = new_s1(j);
                    element(k+4) = new_s2(j);
                    j=j+1;
                end
                
new_chromosome1(i,:) = element; 

           
               
end
 

%}
selectedChromosomes = selection(f_values,population,chromosomes,u1,u2);
nGenes = size(selectedChromosomes,2) ; 
for i = 1:25
    a = randi(size(selectedChromosomes,1));
    b = randi(size(selectedChromosomes,1));
    chromosome1 = selectedChromosomes(a,:);
    chromosome2 = selectedChromosomes(b,:);
    
    crossoverPoint = 1 + fix(rand*(nGenes-1));
    assert(crossoverPoint>0 && crossoverPoint<=nGenes);
    newChromosomePair1(i, :) = [chromosome1(1:crossoverPoint) chromosome2(crossoverPoint+1:end)];
    newChromosomePair2(i, :) = [chromosome2(1:crossoverPoint) chromosome1(crossoverPoint+1:end)];
end


new_generation = [selectedChromosomes;newChromosomePair1;newChromosomePair2];

new_generation=new_generation(any(new_generation,2),any(new_generation,1));


end
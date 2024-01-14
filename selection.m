%pairnei san orisma ton pinaka 100x75 (chromosomes)
function selected = selection(f_values,population,chromosomes,u1,u2)
    
    %dialegei stin TYXI 50 apo ta 100 chromosomes
    %selected = zeros(50,length(chromosomes(1,:))); 
  
    metric = bestfitness(f_values,population,chromosomes,u1,u2);
    output = sort(metric);
    weight = sort(linspace(0.005,1,100),'descend');
    
    out = randsample(output,50,true,weight);


    for i=1:length(out)
        index(i) = find(metric==out(i));
    end

    selected = chromosomes(index,:);

%{
metric = bestfitness(f_values,population,chromosomes,u1,u2);

    for i=1:50
        [~,index(i)] = min(metric);
        metric(index(i)) = NaN;

    end

    selected = chromosomes(index,:);
%}

end
function [SelectedPop] = selection2(chromosomes,f_values,population,u1,u2)
%N = max(size(population));
metric = bestfitness(f_values,size(chromosomes,1),chromosomes,u1,u2);

    for i=1:(population/2)
        [~,index(i)] = max(metric);
        metric(index(i)) = NaN;

    end

    SelectedPop = chromosomes(index,:);

end

% select the best "num" elements from a cell array "population"
function [sorted_population] = sort_(population, sample_points)
N = max(size(population));
%create a new cell array with two elements in each cell : the i-th genome of the population and the value of the fitness function at that genome
for i=1:N
    new_cell{i} = {errorsum(population{i}, sample_points), population{i}}; 
end

%sort the new_cell in ascending order based on the first element of each cell (the fitness value)
for i=2:N
    key = new_cell{i}{1};
    j=i-1;
    while (j >= 1 & new_cell{j}{1} < key) 
        new_cell{j + 1} = new_cell{j};
        j = j - 1;
    end
    new_cell{j + 1} = new_cell{i};
end

%return the sorted popolation
for k=1:N 
    sorted_population{k} = new_cell{k}{2};
end

end








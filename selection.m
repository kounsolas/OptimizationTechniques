function selected = selection(chromosomes)

selected = zeros(50,length(chromosomes(1,:)));

for i=1:50
    selected(i,:) = chromosomes(randi(length(chromosomes(1,:))),:);
end



end
%pairnei san orisma ton pinaka 100x75 (chromosomes)
function selected = selection(chromosomes)
    
    %dialegei stin TYXI 50 apo ta 100 chromosomes
    %selected = zeros(50,length(chromosomes(1,:))); 

    selected = chromosomes(randperm(height(chromosomes)),:);
    %XASE 10 LEPTA EDO AFOU TO THES
   %{ 
    for i=1:50
        selected(i,:) = chromosomes(randi(length(chromosomes(1,:))),:);
    end
   %}
   %GLITOSA MIA FORA
end
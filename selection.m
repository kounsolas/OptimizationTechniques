%pairnei san orisma ton pinaka 100x75 (chromosomes)
function selected = selection(f_values,population,chromosomes,u1,u2)
    
    
    %selected = zeros(population/2,length(chromosomes(1,:))); 
    % metric is the MSE for each of the chromosomes
%{

    metric = bestfitness(f_values,population,chromosomes,u1,u2);
    output = sort(metric);
    weight = sort(linspace(0.005,0.9998,population));
    
    out = randsample(output,population/2,true,weight);

    %index=zeros(1,length(out));
    for i=1:length(out)

        if length(find(metric==out(i))) > 1
            k = find(metric==out(i));
            index(i) = k(1);
           % i = i + length(find(metric==out(i)));
            %i+length(find(metric==out(i)))-1
        else
            index(i) = find(metric==out(i));
        end
    end

    selected = chromosomes(index,:);
   
%}
   
    n = size(chromosomes,2);
    Fitness=bestfitness(f_values,population,chromosomes,u1,u2);
    TotalFitness=sum(Fitness);
    ProbSelection=zeros(population,1);
    CumProb=zeros(population,1);

    for i=1:population
        ProbSelection(i)=Fitness(i)/TotalFitness;
        if i==1
            CumProb(i)=ProbSelection(i);
        else
            CumProb(i)=CumProb(i-1)+ProbSelection(i);
        end
    end

    SelectInd=rand(population,1);

    for i=1:population/2
        flag=0;
        for j=1:population
            if(CumProb(j)<SelectInd(i) && CumProb(j+1)>=SelectInd(i))
                SelectedPop(i,1:n)= chromosomes(j+1,1:n);
                index(i) = j+1;
                flag=1;
                break;
            end
        end
        if(flag==0)
            SelectedPop(i,1:n)= chromosomes(1,1:n);
        end
    end

    selected = SelectedPop;



  
%{

metric = bestfitness(f_values,size(chromosomes,1),chromosomes,u1,u2);

    for i=1:(population/2)
        [~,index(i)] = max(metric);
        metric(index(i)) = NaN;

    end

    selected = chromosomes(index,:);

%}

end
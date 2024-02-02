function [SelectedPop,index] = selection(f_values,population,chromosomes,u1,u2)%pairnei san orisma ton pinaka 100x75 (chromosomes)

    
    
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
    [~,index1] = maxk(Fitness,50);
    TotalFitness=sum(Fitness);
    ProbSelection=zeros(population,1);
    CumulativeProb=zeros(population,1);

    for i=1:population
        ProbSelection(i)=Fitness(i)/TotalFitness;
        if i==1
            CumulativeProb(i)=ProbSelection(i);
        else
            CumulativeProb(i)=CumulativeProb(i-1)+ProbSelection(i);
        end
    end

    SelectInd=rand(population,1);
    SelectedPop = zeros(population/2,n);

    for i=1:population/2
        flag=0;
        for j=1:population
            if(CumulativeProb(j)<SelectInd(i) && CumulativeProb(j+1)>=SelectInd(i))
                SelectedPop(i,1:n)= chromosomes(j+1,1:n);
                flag=1;
                break;
            end
        end
        if(flag==0)
            for k=1:length(index1)
                if(isempty(SelectedPop))
                    SelectedPop(i,:) = chromosomes(index2(k),:);
                    break;
                elseif(SelectedPop(1:i-1,:) ~= chromosomes(index1(k),:))
                        SelectedPop(i,1:n)= chromosomes(index1(k),1:n);
                        break;
                end
            end
        end
    end

    Fitness=bestfitness(f_values,population/2,SelectedPop,u1,u2);
    [~,index] = maxk(Fitness,50);


  
%{

metric = bestfitness(f_values,size(chromosomes,1),chromosomes,u1,u2);

    for i=1:(population/2)
        [~,index(i)] = max(metric);
        metric(index(i)) = NaN;

    end

    SelectedPop = chromosomes(index,:);
   %}

%{
metric = bestfitness(f_values,population,chromosomes,u1,u2);
for i=1:population/2
    a(i) = roulette_wheel_selection(metric);
    SelectedPop(i,:) = chromosomes(a(i),:);
    metric(a(i)) = [];
end

%}
%k = find(index2 == index1)
end
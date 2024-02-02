    clear;
  
    metric = [3 4 5 3 2 1 7 5 1 2 2 9 4];
    s = sum(metric);
    SelectInd=rand(100,1);
    output = sort(metric);
    weight = sort(linspace(0.005,0.9998,length(metric)));
    
    out = randsample(output,round(length(metric)/2),true,weight);
    A = [0 1 0;-1 0 1;0 -1 0]
    inv(A)
    b = [0;1;0]
    c = inv(A)*b
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
    c = metric(index);
for i=1:round(length(metric)/2)
    a(i) = roulette_wheel_selection(metric);
    b(i) = metric(a(i));
    metric(a(i)) = [];
end

q = -0.25 + 1.5*rand(100,1);



function value_Gaussian = generateGaussian(chromosome,x1,y1)


   n = 1;
   for i = 1:5:length(chromosome)
    
     const(n) = chromosome(i);
     c1(n) = chromosome(i+1);
     c2(n) = chromosome(i+2);
     s1(n) = chromosome(i+3);
     s2(n) = chromosome(i+4);
     n = n + 1;

   end
  

value = zeros(length(x1),length(y1));
for k=1:length(x1)
    for j=1:length(y1)
        for i=1:n-1
            power = (x1(k)-c1(i))^2/(2*(s1(i))^2) + (y1(j)-c2(i))^2/(2*(s2(i))^2);
            value(k,j) = value(k,j) + const(i)*exp(-power);
            
        end
    end
end

       
value_Gaussian = value;


end


%{
function value_Gaussian = generateGaussian(chromosome,x1,y1)

syms x y

gaussianFunctions = cell(1,15);

   n = 1;
   for i = 1:5:length(chromosome)
    
     const = chromosome(i);
     c1 = chromosome(i+1);
     c2 = chromosome(i+2);
     s1 = chromosome(i+3);
     s2 = chromosome(i+4);

     power = (x-c1)^2/(2*(s1)^2) + (y-c2)^2/(2*(s2)^2);
     G(x,y) = const*exp(-power);
     gaussianFunctions{n} = G;
     n = n + 1;

   end

Gaussian = gaussianFunctions{1};
    for j=2:15 
        Gaussian = Gaussian + gaussianFunctions{j};
    end

    %epistrefo tin timi tis gaussian gia x1,y1 vectors
   %{
    value_Gaussian = double(subs(Gaussian,{x,y},{x1(:),y1(:)}));
    value_Gaussian = reshape(value_Gaussian, size(x1));
   %}

    [X, Y] = meshgrid(x1, y1);
    value_Gaussian = double(subs(Gaussian, {x, y}, {X(:), Y(:)}));
    value_Gaussian = reshape(value_Gaussian, size(X));
end
%}
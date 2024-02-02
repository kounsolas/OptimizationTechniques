function [discrete_gaussian] = discrete_positive_gaussian(std_deviation, limit)
discrete_gaussian = ceil(abs(std_deviation*randn));
while(discrete_gaussian > limit)
    discrete_gaussian = ceil(abs(std_deviation*randn));
end
    
end
%{


%}

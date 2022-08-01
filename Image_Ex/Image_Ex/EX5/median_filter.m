function [ output_args ] = median_filter(n)
%   Detailed explanation goes here


[p q]=size(I);
J2=zeros(p+10,q+10);
for i=11:p+5;
    for j=11:q+5;
        J2(i,j)=J(i-5,j-5);
    end
end


end


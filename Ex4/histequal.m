function [output_img, y_prime] = histequal(input_img)
L = 256;
[m,n] = size(input_img);
my_hist = zeros(1,L);

img_1D = input_img(:);
my_hist = imhist(input_img);

p = my_hist./(m*n);


y_prime = cumsum(p);
y = floor(y_prime*(L-1)+0.5);

for i = 1:m*n
    img_1D(i) = y(img_1D(i)+1);
end
output_img = reshape(img_1D, m,n);


% for i = 1:m
%     for j = 1:n
%         my_hist(input_img(i,j)+1) = my_hist(input_img(i,j)+1) + 1;
%     end
% end
% for i = 1:length(img_1D)
%     my_hist(img_1D(i)+1) = my_hist(img_1D(i)+1) + 1;
% end
% y_prime = zeros(L,1); % CDF
% y_prime(1,1) = p(1);
% for i = 2:length(p)
%    y_prime(i,1) = p(i) + y_prime(i-1,1); 
% end

function output_img = histequal(input_img)
[m,n] = size(input_img);
my_hist = zeros(1,256);
% for i = 1:m
%     for j = 1:n
%         my_hist(input_img(i,j)) = my_hist(input_img(i,j)) + 1;
%     end
% end
my_hist = imhist(input_img);
prob_hist = double(my_hist./(m*n));
cdf_img = zeros(1,256);
cdf_img(1) = prob_hist(1);
for i = 2:length(prob_hist)
   cdf_img(1,i) = prob_hist(i) + cdf_img(1,i-1); 
end
cdf_img = floor(255*(cdf_img));

img_1D = input_img(:);
for i = 1:m*n
    img_1D(i) = cdf_img(img_1D(i)+1);
end
output_img = reshape(img_1D, m,n);




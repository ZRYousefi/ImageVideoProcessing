function output_img = med_filter(input_img, filter_size)
[m, n]=size(input_img);
padsize = floor(filter_size/2);
pad_img = padarray(input_img, [padsize,padsize]);
for i = 1:m
    for j = 1:n
        img_patch = pad_img(i:i+filter_size-1, j:j+filter_size-1);
        output_img(i,j) = median(img_patch(:));
    end
end



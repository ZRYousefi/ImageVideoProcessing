function [outputImage] = ContrastStretch(Image)

r = Image(:);
min_val = min(r);
max_val = max(r);

s = (255/(max_val-min_val))*(r-min_val);

outputImage = uint8(reshape(s,[256,256])); 




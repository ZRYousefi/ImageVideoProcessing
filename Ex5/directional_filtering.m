function [out0,out45,out90,out135] = directional_filtering(input_img, kernel)

f0 = [zeros(1,kernel); ones(1,kernel); zeros(1,kernel)]/kernel;
f45 = eye(kernel)/kernel;
f90 = rot90(f0);
f135 = rot90(f45);

out0 = imfilter(input_img,f0,'same');
out45 = imfilter(input_img,f45,'same');
out90 = imfilter(input_img,f90,'same');
out135 = imfilter(input_img,f135,'same');



clear all;
close all;
clc;

img_1 = imread('01grotto.jpg');                   % reading both images
img_2 = imread('guard108.jpg');

% applying averaging filter 
h = fspecial('average',5);                        
R_filtered_1 = imfilter(img_1(:,:,1),h);
G_filtered_1 = imfilter(img_1(:,:,2),h);
B_filtered_1 = imfilter(img_1(:,:,3),h);
filtered_img_1 = cat(3,R_filtered_1,G_filtered_1,B_filtered_1);

% using contrast stretching transformation
R_enhanced_1 = Contrast_Stretch( filtered_img_1(:,:,1));     
G_enhanced_1 = Contrast_Stretch( filtered_img_1(:,:,2));  
B_enhanced_1 = Contrast_Stretch( filtered_img_1(:,:,3)); 

R = reshape(R_enhanced_1,size(img_1,1),size(img_1,2));
G = reshape(G_enhanced_1,size(img_1,1),size(img_1,2));
B = reshape(B_enhanced_1,size(img_1,1),size(img_1,2));
RGB_1 = cat(3,R,G,B);


% using median filter on each component
R_filtered_2 = medfilt2(img_2(:,:,1),[5 5]);
G_filtered_2 = medfilt2(img_2(:,:,2),[5 5]);
B_filtered_2 = medfilt2(img_2(:,:,3),[5 5]);
filtered_img_2 = cat(3,R_filtered_2,G_filtered_2,B_filtered_2);


figure(1);
subplot(121);imshow(img_1);title('original image')
subplot(122);imshow(RGB_1);title('filtered image')

figure(2);
subplot(121);imshow(img_2);title('original image')
subplot(122);imshow(filtered_img_2);title('filtered image')



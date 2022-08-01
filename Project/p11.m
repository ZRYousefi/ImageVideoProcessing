clear all;
close all;
clc;

%% Intensity Equalization

I1 = imread('kitchen.jpg');
I1_ints_eq = intensityeq(I1);
figure
imshowpair(I1,I1_ints_eq,'montage')
title('Original (left) and Intensity equality (right) Image')

I2 = imread('firework.jpg');
I2_ints_eq = intensityeq(I2);
figure
imshowpair(I2,I2_ints_eq,'montage')
title('Original (left) and Intensity equality (right) Image')

% figure,imshow(I1), title('Original')
% figure,imshow(I1_ints_eq), title('Intensity equalization')
% 
% figure,imshow(I2), title('Original')
% figure,imshow(I2_ints_eq), title('Intensity equalization')
%% Histogram Equalization

I1 = imread('pontano2.jpg');
W1 = histeq(I1); 
figure
imshowpair(I1,W1,'montage')
title('Original (left) and Histogram equality (right) Image')

figure,
subplot(121), imhist(I1), title('Original histogram');
subplot(122), imhist(W1), title('Equalized histogram');

% I2 = imread('tarlati5.jpg');
% W2 = histeq(I2); 
% figure
% imshowpair(I2,W2,'montage')
% title('Original (left) and Histogram equality (right) Image')
% 

I2 = imread('bridget.jpg');
W2 = histeq(I2); 
figure
imshowpair(I2,W2,'montage')
title('Original (left) and Histogram equality (right) Image')


figure,
subplot(121), imhist(I2), title('Original histogram');
subplot(122), imhist(W2), title('equalized histogram');

% figure,imshow(I1), title('Original')
% figure,imshow(W1), title('Histogram equality ')
% figure,imshow(I2), title('Original')
% figure,imshow(W2), title('Histogram equality ')

%% Spatial Filtering

I1 = imread('floor2.jpg');

% converting RGB image into HSV
hsv_I_1 = rgb2hsv(I1);
H = hsv_I_1(:,:,1);
S = hsv_I_1(:,:,2);
V = hsv_I_1(:,:,3);
% size of the mask
n = 5;
% filter_HSV = imfilter(hsv_I, fspecial('average', [n n]));
% filter_V = imfilter(V, fspecial('average', [n n]));
% V_f = cat(3,H,S,filter_V);
% V_filt = hsv2rgb(V_f);

med_filter_V = medfilt2(V, [n n]);
med_V_f_1 = cat(3,H,S,med_filter_V);
med_V_filt_1 = hsv2rgb(med_V_f_1);

figure,
subplot(121), imshow(I1), title('Original')
% subplot(132), imshow(V_filt), title('V Filtered')
subplot(122), imshow(med_V_filt_1), title('MED V Filtered')

I2 = imread('guard108.jpg');

% converting RGB image into HSV
hsv_I_2 = rgb2hsv(I2);
H = hsv_I_2(:,:,1);
S = hsv_I_2(:,:,2);
V = hsv_I_2(:,:,3);
% size of the mask
n = 5;
% filter_HSV = imfilter(hsv_I, fspecial('average', [n n]));
% filter_V = imfilter(V, fspecial('average', [n n]));
% V_f = cat(3,H,S,filter_V);
% V_filt = hsv2rgb(V_f);

med_filter_V = medfilt2(V, [n n]);
med_V_f_2 = cat(3,H,S,med_filter_V);
med_V_filt_2 = hsv2rgb(med_V_f_2);

figure,
subplot(121), imshow(I2), title('Original')
subplot(122), imshow(med_V_filt_2), title('MED V Filtered')
 


figure,imshow(I1), title('Original')
figure,imshow(med_V_filt_1), title('Median filtering')
figure,imshow(I2), title('Original')
figure,imshow(med_V_filt_2), title('Median filtering')

%%  Pseudo-Coloring  

%Read the input image
I1 = imread('medal.jpg');

% % If the image is 3D the following line should be uncommented
% I1 = I1(:,:,1);
I1(I1==0) = 1;

%Pre-allocate the output matrix for the output image
Output1 = ones([size(I1,1) size(I1,2) 3]);

% Color map
map1 = colormap('hot(256)');

%Assign the columns to 1-D RED,GREEN and BLUE
Red = map1(:,1);
Green = map1(:,2);
Blue = map1(:,3);

%Map the colors based on the intensity of the image
Output1(:,:,1) = Red(I1);
Output1(:,:,2) = Green(I1);
Output1(:,:,3) = Blue(I1);

Output1 = im2uint8(Output1);

% figure,imshow(I1), title('Original')
% figure,imshow(Output1), title('Color map')

figure
imshowpair(I1,Output1,'montage')
title('Original (left) and Coloring (right) Image')


I2 = imread('goblet1.jpg');
I2(I2==0) = 1;
Output2 = zeros([size(I2,1) size(I2,2) 3]);
map2 = colormap(hot(255));
%Assign the columns to 1-D RED,GREEN and BLUE
Red = map2(:,1);
Green = map2(:,2);
Blue = map2(:,3);

%MAP THE COLORS BASED ON THE INTENSITY OF THE IMAGE

Output2(:,:,1) = Red(I2);
Output2(:,:,2) = Green(I2);
Output2(:,:,3) = Blue(I2);


Output2 = im2uint8(Output2);

% figure,imshow(I2), title('Original')
% figure,imshow(Output2), title('Color map')
figure
imshowpair(I2,Output2,'montage')
title('Original (left) and Coloring (right) Image')

%%  Color Balance

I1 = imread('stillife (3).jpg');
color_balance_1 = wbalance(I1); 
figure
imshowpair(I1,color_balance_1,'montage')
title('Original (left) and Color balance (right) Image')

I2 = imread('egmond1.jpg');
color_balance_2 = wbalance(I2); 
figure
imshowpair(I2,color_balance_2,'montage')
title('Original (left) and Color balance (right) Image')

% figure,imshow(I1), title('Original')
% figure,imshow(color_balance_1), title('Color balance')
% figure,imshow(I2), title('Original')
% figure,imshow(color_balance_2), title('Color balance')


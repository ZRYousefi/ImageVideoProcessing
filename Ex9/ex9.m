clear all
close all
clc

%% Task 1
I1 = imread('fruits.jpg');
I1_hist_eq = histogrameq(I1);
I1_ints_eq = intensityeq(I1);

I2 = imread('festia.jpg');
I2_hist_eq = histogrameq(I2);
I2_ints_eq = intensityeq(I2);


figure,
subplot(231), imshow(I1), title('1 Original');
subplot(232), imshow(I1_hist_eq), title('1 histeq');
subplot(233), imshow(I1_ints_eq), title('1 inteq');
subplot(234), imshow(I2), title('2 Original');
subplot(235), imshow(I2_hist_eq), title('2 histeq');
subplot(236), imshow(I2_ints_eq), title('2 inteq');

%% Task 2
clear all
close all
clc

I = imread('lake.jpg');
hsv_I = rgb2hsv(I);
H = hsv_I(:,:,1);
S = hsv_I(:,:,2);
V = hsv_I(:,:,3);

gt_H = graythresh(H);
gt_S = graythresh(S);
gt_V = graythresh(V);

BW_S = im2bw(hsv_I, gt_S);
L_S = bwlabel(BW_S);

Lake = find(L_S == L_S(300,300));
segmented = zeros(size(BW_S));
segmented(Lake) = 1;

Obj = hsv2rgb(cat(3,H,S,segmented));
figure,
subplot(121), imshow(I), title('Original')
subplot(122), imshow(Obj,[]), title('Extracted Object')
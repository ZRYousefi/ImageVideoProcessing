close all
clear all
clc

%% Task 1 
dist = 100;
cheetah = imread('cheetah.jpg');
figure, 
PIX1 = impixel(cheetah)
chosen_pixel = PIX1(1,:);
I1 = double(cheetah);
Cube_I1 = sliceCube(I1, chosen_pixel, dist);
Sphere_I1 = sliceCube(I1, chosen_pixel, dist);

figure,
subplot(131), imshow(cheetah), title('Original')
subplot(132), imshow(Cube_I1), title('Cube sliced')
subplot(133), imshow(Sphere_I1), title('Sphere sliced')

chameleon = imread('chameleon.jpg');
figure, 
PIX2 = impixel(chameleon)
chosen_pixel = PIX2(1,:);
I2 = double(chameleon);
Cube_I2 = sliceCube(I2, chosen_pixel, dist);
Sphere_I2 = sliceCube(I2, chosen_pixel, dist);



figure,
subplot(131), imshow(chameleon), title('Original')
subplot(132), imshow(Cube_I2), title('Cube sliced')
subplot(133), imshow(Sphere_I2), title('Sphere sliced')

%% Task 2

clear all
close all,
clc

I = imread('lena.tiff');
hsv_I = rgb2hsv(I);
R = I(:,:,1);
G = I(:,:,2);
B = I(:,:,3);

H = hsv_I(:,:,1);
S = hsv_I(:,:,2);
V = hsv_I(:,:,3);

figure,
subplot(231), imshow(R), title('R')
subplot(232), imshow(G), title('G')
subplot(233), imshow(B), title('B')
subplot(234), imshow(H), title('H')
subplot(235), imshow(S), title('S')
subplot(236), imshow(V), title('V')

% b

G_n = imnoise(G,'gaussian');
G_noisy = cat(3,R,G_n,B);

figure, 
subplot(121), imshow(I), title('Original')
subplot(122), imshow(G_noisy), title('G noisy')

hsv_RGB_noisy = rgb2hsv(G_noisy);
H_gn = hsv_RGB_noisy(:,:,1);
S_gn = hsv_RGB_noisy(:,:,2);
V_gn = hsv_RGB_noisy(:,:,3);

figure,
subplot(231), imshow(R), title('R')
subplot(232), imshow(G_n), title('G noisy')
subplot(233), imshow(B), title('B')
subplot(234), imshow(H_gn), title('H g noisy')
subplot(235), imshow(S_gn), title('S g noisy')
subplot(236), imshow(V_gn), title('V g noisy')

% c
R_n = imnoise(R,'gaussian');
G_n = imnoise(G,'gaussian');
B_n = imnoise(B,'gaussian');
RGB_noisy = cat(3,R_n,G_n,B_n);

figure, 
subplot(121), imshow(I), title('Original')
subplot(122), imshow(RGB_noisy), title('RGB noisy')


hsv_RGB_noisy = rgb2hsv(RGB_noisy);
H_rgbn = hsv_RGB_noisy(:,:,1);
S_rgbn = hsv_RGB_noisy(:,:,2);
V_rgbn = hsv_RGB_noisy(:,:,3);

figure,
subplot(231), imshow(R_n), title('R noisy')
subplot(232), imshow(G_n), title('G noisy')
subplot(233), imshow(B_n), title('B noisy')
subplot(234), imshow(H_rgbn), title('H rgb noisy')
subplot(235), imshow(S_rgbn), title('S rgb noisy')
subplot(236), imshow(V_rgbn), title('V rgb noisy')


% d

filter_RGB = imfilter(RGB_noisy, fspecial('average', [3 3]));
filter_R = imfilter(R_n, fspecial('average', [3 3]));
filter_G = imfilter(G_n, fspecial('average', [3 3]));
filter_B = imfilter(B_n, fspecial('average', [3 3]));

RGB_filt = cat(3,filter_R,filter_G,filter_B);
R_filt = cat(3,filter_R,G_n,B_n);
G_filt = cat(3,R_n,filter_G,B_n);
B_filt = cat(3,R_n,G_n,filter_B);

figure,
subplot(141), imshow(R_filt), title('R Filtered')
subplot(142), imshow(G_filt), title('G Filtered')
subplot(143), imshow(B_filt), title('B Filtered')
subplot(144), imshow(RGB_filt), title('RGB Filtered')



filter_HSV = imfilter(hsv_RGB_noisy, fspecial('average', [3 3]));
filter_H = imfilter(H_rgbn, fspecial('average', [3 3]));
filter_S = imfilter(S_rgbn, fspecial('average', [3 3]));
filter_V = imfilter(V_rgbn, fspecial('average', [3 3]));

HSV_filt = cat(3,filter_H,filter_S,filter_V);
H_f = cat(3,filter_H,S_rgbn,V_rgbn);
H_filt = hsv2rgb(H_f);
S_f = cat(3,H_rgbn,filter_S,V_rgbn);
S_filt = hsv2rgb(S_f);
V_f = cat(3,H_rgbn,S_rgbn,filter_V);
V_filt = hsv2rgb(V_f);

figure,
subplot(141), imshow(H_filt), title('H Filtered')
subplot(142), imshow(S_filt), title('S Filtered')
subplot(143), imshow(V_filt), title('V Filtered')
subplot(144), imshow(HSV_filt), title('HSV Filtered')


%% 
% The Hue is related to color and it can be corrupted by applying a
% low-pass filter, the color information is sensitive and the color structure can be degraded in this way.. 
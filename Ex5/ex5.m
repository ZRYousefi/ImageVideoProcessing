%% Task 1
close all
clear all
clc

img = imread('cameraman.tif');
X = [-1 -1 -1;-1 8 -1;-1 -1 -1];
Y = [-1 -1 -1;-1 9 -1;-1 -1 -1];
Z = [-1 -1 -1;-1 9.7 -1;-1 -1 -1]; 

 
out1=imfilter(img,X,'same');
out2=imfilter(img,Y,'same');
out3=imfilter(img,Z,'same');

figure,
subplot(2,2,1), imshow(img)
subplot(2,2,2), imshow(out1)
subplot(2,2,3), imshow(out2)
subplot(2,2,4), imshow(out3)

%% Task 2
close all,
clear all,
clc,

% a
I = imread('cameraman.tif');
N = uint8(rand(size(I))*10);

noisy_img = I + N;
figure,
subplot(1,2,1), imshow(I)
subplot(1,2,2), imshow(noisy_img)

% b 
[out0_3,out45_3,out90_3,out135_3] = directional_filtering(noisy_img, 3);
figure, 
subplot(2,2,1), imshow(out0_3), title('kernel 3, direction 0')
subplot(2,2,2), imshow(out45_3), title('kernel 3, direction 45')
subplot(2,2,3), imshow(out90_3), title('kernel 3, direction 90')
subplot(2,2,4), imshow(out135_3), title('kernel 3, direction 135')

[out0_5,out45_5,out90_5,out135_5] = directional_filtering(noisy_img, 5);
figure, 
subplot(2,2,1), imshow(out0_5), title('kernel 5, direction 0')
subplot(2,2,2), imshow(out45_5), title('kernel 5, direction 45')
subplot(2,2,3), imshow(out90_5), title('kernel 5, direction 90')
subplot(2,2,4), imshow(out135_5), title('kernel 5, direction 135')

[out0_7,out45_7,out90_7,out135_7] = directional_filtering(noisy_img, 7);
figure, 
subplot(2,2,1), imshow(out0_7), title('kernel 7, direction 0')
subplot(2,2,2), imshow(out45_7), title('kernel 7, direction 45')
subplot(2,2,3), imshow(out90_7), title('kernel 7, direction 90')
subplot(2,2,4), imshow(out135_7), title('kernel 7, direction 135')

%% Task 3
clc
close all
clear all

% a
img = imread('Miranda1.tif');
noise = uint8(rand(size(100,100))*60);
noisy_img =  img;
noisy_img(150:249,150:249) = noise + noisy_img(150:249,150:249);

% b

n=3;
median_filtered_img = med_filter(noisy_img,n);
figure,
subplot(1,3,1), subimage(img), title('original')
subplot(1,3,2), subimage(noisy_img), title('noisy')
subplot(1,3,3), subimage(median_filtered_img), title('median filtered')

% c

n=3;
alpha = 100;
thr_filtered_img = med_filter_thr(noisy_img,n, alpha);
figure,
subplot(1,3,1), subimage(img), title('original')
subplot(1,3,2), subimage(noisy_img), title('noisy')
subplot(1,3,3), subimage(thr_filtered_img), title('median threshold filtered')



% high pass filtering is taking the derivative and we will have some negative values in spacial domain. 
% therefore if we didn't have any negative values in our filter, it means that we don't have any difference 
% and we only have summation, so it will be low-pass filter. 



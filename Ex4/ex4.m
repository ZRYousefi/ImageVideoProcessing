% %% Task 1
% close all;
% clear all;
% clc
% 
% university = imread('university.png');
% I = double(university);
% c = 30;
% T = uint8(c*log(1 + I));
% 
% gamma = 0.4;
% T2 = uint8(c * power(I,gamma));
% 
% figure,
% subplot(1,3,1); imshow(university); title('Original image');
% subplot(1,3,2); imshow(T); title('1st trasnformation');
% subplot(1,3,3); imshow(T2); title('2nd trasnformation');
% 
% %% Task 2
% clear all
% close all
% clc
% 
% I1 = imread('moon.png');
% I2 = imread('house.png');
% I3 = imread('spine.jpg');
% I4 = imread('church.png');
% 
% [I1_new,cdf_I1] = histequal(I1);
% [I2_new,cdf_I2] = histequal(I2);
% [I3_new,cdf_I3] = histequal(I3);
% [I4_new,cdf_I4] = histequal(I4);
% 
% figure,
% subplot(2,2,1),imshow(I1)
% subplot(2,2,2), imshow(I1_new)
% subplot(2,2,3),imhist(I1)
% subplot(2,2,4), imhist(I1_new)
% 
% figure,
% subplot(2,2,1),imshow(I2)
% subplot(2,2,2), imshow(I2_new)
% subplot(2,2,3),imhist(I2)
% subplot(2,2,4), imhist(I2_new)
% 
% figure,
% subplot(2,2,1),imshow(I3)
% subplot(2,2,2), imshow(I3_new)
% subplot(2,2,3),imhist(I3)
% subplot(2,2,4), imhist(I3_new)
% 
% figure,
% subplot(2,2,1),imshow(I4)
% subplot(2,2,2), imshow(I4_new)
% subplot(2,2,3),imhist(I4)
% subplot(2,2,4), imhist(I4_new)
% 
% 
% 
%  ContrastStretch(I1, 0, 255);
%  ContrastStretch(I2, 0, 255);
%  ContrastStretch(I3, 0, 255);
%  ContrastStretch(I4, 0, 255);

%% Task 3

clear all
close all
clc

A = imread('corel.png');
B = imread('spine.jpg');


A_B = histMatch(A,B);

figure,
subplot(2,3,1), imshow(A);
subplot(2,3,2), imshow(B);
subplot(2,3,3), imshow(A_B);
subplot(2,3,4), imhist(A);
subplot(2,3,5), imhist(B);
subplot(2,3,6), imhist(A_B);

C = imread('church.png');
A_C = histMatch(A,C);

figure,
subplot(2,3,1), imshow(A);
subplot(2,3,2), imshow(C);
subplot(2,3,3), imshow(A_C);
subplot(2,3,4), imhist(A);
subplot(2,3,5), imhist(C);
subplot(2,3,6), imhist(A_C);


% Task 4
% histogram equalization is a mathematical transformation which tries to
% convert the histogram to a uniform histogram as much as possible.
% Therefore, by applying again and again we don't get better uniformity. 

% Task 5

% moon: intensities are similar in smaller windows, therefore by applying
% histogram equalization we only increase the noise without any enhancement
% spin: has high contrast and localized histogram equalization will give
% more information in the areas where we have black and white. 
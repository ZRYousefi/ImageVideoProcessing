clear all;
close all;
clc;
img_1 = imread('registr1.jpg');                   % reading an image
img_2 = imread('floor2.jpg');

hsv_img_1 = rgb2hsv(img_1);                       % convert to HSV
hsv_img_2 = rgb2hsv(img_2);

V_img_1 = hsv_img_1(:,:,3);                       % V channel
V_img_2 = hsv_img_2(:,:,3);

V_filtered_1 = medfilt2(V_img_1,[5 5]);            % applying median filter on intendity channel
V_filtered_2 = medfilt2(V_img_2,[5 5]);

hsv_img_1(:,:,3) = V_filtered_1;                   % put filtered V channel to HSV 
hsv_img_2(:,:,3) = V_filtered_2; 

RGB_img_1 = hsv2rgb(hsv_img_1);                    % convert to RGB
RGB_img_2 = hsv2rgb(hsv_img_2);

% using power-law transformation on each RGB components
R_enhanced_1 = RGB_img_1(:,:,1).^1.2;     
G_enhanced_1 = RGB_img_1(:,:,2).^1.2;
B_enhanced_1 = RGB_img_1(:,:,3).^1.2;
RGB_1 = cat(3,R_enhanced_1,G_enhanced_1,B_enhanced_1);

R_enhanced_2 = RGB_img_2(:,:,1).^1.2;     
G_enhanced_2 = RGB_img_2(:,:,2).^1.2;
B_enhanced_2 = RGB_img_2(:,:,3).^1.2;
RGB_2 = cat(3,R_enhanced_2,G_enhanced_2,B_enhanced_2);

figure(1);
subplot(121);imshow(img_1);title('original image');
subplot(122);imshow(RGB_1);title('enhanced image');

figure(2);
subplot(121);imshow(img_2);title('original image');
subplot(122);imshow(RGB_2);title('enhanced image');


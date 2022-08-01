clear all
close all
clc

%% Task 1
I1 = imread('funeral.jpg');
I1_hist_eq = histogrameq(I1);
I1_ints_eq = intensityeq(I1);

I2 = imread('firework.jpg');
I2_hist_eq = histogrameq(I2);
I2_ints_eq = intensityeq(I2);

figure,
subplot(231), imshow(I1), title('1 Original');
subplot(232), imshow(I1_hist_eq), title('1 histeq');
subplot(233), imshow(I1_ints_eq), title('1 inteq');
subplot(234), imshow(I2), title('2 Original');
subplot(235), imshow(I2_hist_eq), title('2 histeq');
subplot(236), imshow(I2_ints_eq), title('2 inteq');

I1 = double(imread('vase3.jpg'));
log_image_I1 = uint8(log_transform(I1, 3));
min_log = min(log_image_I1(:));
max_log = max(log_image_I1(:));

c = 255/max_log; 
log_image_I1_new = 42.5*log_image_I1;

figure,
subplot(121), imshow(uint8(I1)), title('Original');
subplot(122), imshow(log_image_I1_new), title('Log Transform');

I = imread('stillife (3).jpg');
W=wbalance(I); 


grayImage = rgb2gray(I); % Convert to gray so we can get the mean luminance.
% Extract the individual red, green, and blue color channels.
redChannel = I(:, :, 1);
greenChannel = I(:, :, 2);
blueChannel = I(:, :, 3);
meanR = mean2(redChannel);
meanG = mean2(greenChannel);
meanB = mean2(blueChannel);
meanGray = mean2(grayImage);
% Make all channels have the same mean
redChannel = uint8(double(redChannel) * meanGray / meanR);
greenChannel = uint8(double(greenChannel) * meanGray / meanG);
blueChannel = uint8(double(blueChannel) * meanGray / meanB);
% Recombine separate color channels into a single, true color RGB image.
rgbImage = cat(3, redChannel, greenChannel, blueChannel);
figure,
subplot(121), imshow(uint8(I)), title('Original');
subplot(122), imshow(rgbImage), title('Log Transform');
%% 
I = imread('marne.jpg');
n = 10;
hsv_I = rgb2hsv(I);
R = I(:,:,1);
G = I(:,:,2);
B = I(:,:,3);

H = hsv_I(:,:,1);
S = hsv_I(:,:,2);
V = hsv_I(:,:,3);

filter_RGB = imfilter(I, fspecial('average', [n n]));
% filter_R = imfilter(R, fspecial('average', [n n]));
% filter_G = imfilter(G, fspecial('average', [n n]));
% filter_B = imfilter(B, fspecial('average', [n n]));
% RGB_filt = cat(3,filter_R,filter_G,filter_B);

med_filter_R = medfilt2(R, [n n]);
med_filter_G = medfilt2(G, [n n]);
med_filter_B = medfilt2(B, [n n]);
med_filter_RGB = cat(3,med_filter_R,med_filter_G,med_filter_B);

figure,
subplot(131), imshow(I), title('Original');
subplot(132), imshow(filter_RGB), title('RGB Filtered')
subplot(133), imshow(med_filter_RGB), title('MED Filtered')

filter_HSV = imfilter(hsv_I, fspecial('average', [n n]));
filter_V = imfilter(V, fspecial('average', [n n]));
V_f = cat(3,H,S,filter_V);
V_filt = hsv2rgb(V_f);

med_filter_V = medfilt2(V, [n n]);
med_V_f = cat(3,H,S,med_filter_V);
med_V_filt = hsv2rgb(med_V_f);

figure,
subplot(121), imshow(I), title('Original')
subplot(122), imshow(V_filt), title('V Filtered')
subplot(122), imshow(med_V_filt), title('MED V Filtered')


%%

I = imread('monthmay.jpg');
% RGB = ind2rgb(X,MAP);
LAB = rgb2lab(I);
L = LAB(:,:,1)/100;
L = adapthisteq(L,'NumTiles',[8 8],'ClipLimit',0.005);
LAB(:,:,1) = L*100;
J = lab2rgb(LAB);
figure
imshowpair(I,J,'montage')
title('Original (left) and Contrast Enhanced (right) Image')
%%

[X, map] = imread('funeral.jpg');
S = decorrstretch(X,'tol',0.001);
figure
imshow(X,map)
title('Original Image')
figure
imshow(S)
title('Enhanced Image')


stretched_truecolor = imadjust(truecolor,stretchlim(truecolor));
f4 = figure;
imshow(stretched_truecolor)
figure(f4);
title('Truecolor Composite after Contrast Stretch')



shadow = imread('abbati1.jpg');
srgb2lab = makecform('srgb2lab');
lab2srgb = makecform('lab2srgb');

shadow_lab = applycform(shadow, srgb2lab); % convert to L*a*b*

% the values of luminosity can span a range from 0 to 100; scale them
% to [0 1] range (appropriate for MATLAB(R) intensity images of class double) 
% before applying the three contrast enhancement techniques
max_luminosity = 100;
L = shadow_lab(:,:,1)/max_luminosity;

% replace the luminosity layer with the processed data and then convert
% the image back to the RGB colorspace
shadow_imadjust = shadow_lab;
shadow_imadjust(:,:,1) = imadjust(L)*max_luminosity;
shadow_imadjust = applycform(shadow_imadjust, lab2srgb);

shadow_histeq = shadow_lab;
shadow_histeq(:,:,1) = histeq(L)*max_luminosity;
shadow_histeq = applycform(shadow_histeq, lab2srgb);

shadow_adapthisteq = shadow_lab;
shadow_adapthisteq(:,:,1) = adapthisteq(L)*max_luminosity;
shadow_adapthisteq = applycform(shadow_adapthisteq, lab2srgb);

figure, imshow(shadow);
title('Original');

figure, imshow(shadow_imadjust);
title('Imadjust');

figure, imshow(shadow_histeq);
title('Histeq');



imgBlur = imread('funeral.jpg');
sharpCoeff = [0 0 0;0 1 0;0 0 0]-fspecial('laplacian',0.2);

f = @() imfilter(imgBlur,sharpCoeff,'symmetric');
fprintf('Elapsed time is %.6f seconds.\n',timeit(f));

imgSharp = imfilter(imgBlur,sharpCoeff,'symmetric');
figure
imshowpair(imgBlur,imgSharp,'montage')
title('Blurred Image and Sharpened Image')

Kaverage = filter2(fspecial('average',3),imgSharp)/255;
figure
imshow(Kaverage)

K = wiener2(imgSharp,[5 5]);
figure
imshow(K(600:1000,1:600));
title('Portion of the Image with Noise Removed by Wiener Filter');





clear all
close all
clc
% a
I = imread('alcestis.jpg');
n = size(I,1);
m = size(I,2);
I_yCbCr = rgb2ycbcr(I);

y = I_yCbCr(:,:,1);
Cb = I_yCbCr(:,:,2);
Cr = I_yCbCr(:,:,3);
figure,
subplot(131);imshow(y), title('y')
subplot(132);imshow(Cb), title('Cb')
subplot(133);imshow(Cr), title('Cr')

% b
Cb_sub_422 = Cb(:, 1:2:end);
Cr_sub_422 = Cr(:,1:2:end);

Cb_sub_411 = Cb(:, 1:4:end);
Cr_sub_411 = Cr(:, 1:4:end);

Cb_sub_420 = Cb(1:2:end, 1:2:end);
Cr_sub_420 = Cr(1:2:end, 1:2:end);

y_sub_420 = y(1:2:end, 1:2:end);

Cb_up_422 = imresize(Cb_sub_422, [n,m]);
Cr_up_422 = imresize(Cr_sub_422, [n,m]);

Cb_up_411 = imresize(Cb_sub_411, [n,m]);
Cr_up_411 = imresize(Cr_sub_411, [n,m]);

Cb_up_420 = imresize(Cb_sub_420, [n,m]);
Cr_up_420 = imresize(Cr_sub_420, [n,m]);

y_up_420 = imresize(y_sub_420, [n,m]);

yCbCr_up_CbCr_422 = ycbcr2rgb(cat(3,y,Cb_up_422,Cr_up_422));
yCbCr_up_CbCr_411 = ycbcr2rgb(cat(3,y,Cb_up_411,Cr_up_411));
yCbCr_up_CbCr_420 = ycbcr2rgb(cat(3,y,Cb_up_420,Cr_up_420));
yCbCr_up_y_420 = ycbcr2rgb(cat(3,y_up_420,Cb,Cr));


figure,
subplot(151);imshow(I), title('Original')
subplot(152);imshow(uint8(yCbCr_up_CbCr_422)), title('Chrominance 422')
subplot(153);imshow(uint8(yCbCr_up_CbCr_411)), title('Chrominance 411')
subplot(154);imshow(uint8(yCbCr_up_CbCr_420)), title('Chrominance 420')
subplot(155);imshow(uint8(yCbCr_up_y_420)), title('Luminance 420')

immse_up_CbCr_422 = immse(I,yCbCr_up_CbCr_422)
immse_up_CbCr_411 = immse(I,yCbCr_up_CbCr_411)
immse_up_CbCr_420 = immse(I,yCbCr_up_CbCr_420)
immse_up_y_420 = immse(I,yCbCr_up_y_420)
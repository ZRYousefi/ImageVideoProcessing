clear all
close all
clc

%% Task 1
% a
load yuvdata.mat
size = cols*rows;
% b
Y = reshape(yy,[cols rows]);
uu_reshape = reshape(uu,[cols/2 rows/2]);
vv_reshape = reshape(vv,[cols/2 rows/2]);

U = imresize(uu_reshape,[cols rows]);
V = imresize(vv_reshape,[cols rows]);

figure,
subplot(131);imshow(uint8(Y)');title('yy reshape')
subplot(132);imshow(uint8(U)');title('uu reshape')
subplot(133);imshow(uint8(V)');title('vv reshape')
% c
U = U-127;
V = V-127;
% d
YUV = cat(2,Y(:),U(:),V(:));
% e
yuvToRgb=[1     0         1.402;
          1    -0.34413   -0.71414;
          1     1.772    0       ];
RGB = yuvToRgb * YUV';
% f
R = reshape(RGB(1,:),[cols rows]);
G = reshape(RGB(2,:),[cols rows]);
B = reshape(RGB(3,:),[cols rows]);

i = cat(3,R',G',B');
figure
I = uint8(i);
imshow(I)
%% Task 2
clear all
close all
clc
% a
I = imread('lena.tiff');
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
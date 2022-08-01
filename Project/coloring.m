clear all
close all
clc

%READ INPUT IMAGE
A = imread('medal.jpg');
% A = A(:,:,1);
A(A==0)=1;
%RESIZE IMAGE
% A = imresize(I,[256 256]);
%PRE-ALLOCATE THE OUTPUT MATRIX
Output = ones([size(A,1) size(A,2) 3]);

%COLORMAPS
maps={'jet(256)';'hsv(256)';'cool(256)';'spring(256)';'summer(256)';'parula(256)';'hot(256)'};


%COLORMAP 2
map=colormap(char(maps(7)));
Red = map(:,1);
Green = map(:,2);
Blue = map(:,3);

Output(:,:,1) = Red(A);
Output(:,:,2) = Green(A);
Output(:,:,3) = Blue(A);

Output = im2uint8(Output);

figure
imshowpair(A,Output,'montage')
title('Original (left) and Coloring (right) Image')


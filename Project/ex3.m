clear all,
close all,
clc,
%% Task 1
% a
I1 = imread('firework.jpg');
[m,n] = size(I1);
% my_hist = zeros(1,256);
% for i = 1:m
%     for j = 1:n
%         my_hist(I1(i,j)) = my_hist(I1(i,j)) + 1;
%     end
% end
% figure,
% bar(my_hist)


% b 
I2 = imread('firework.jpg');
[CS1] = ContrastStretch(I1);
[CS2] = ContrastStretch(I2);

figure,
subplot(2,2,1), imshow(I1)
subplot(2,2,2), imshow(CS1)
subplot(2,2,3), imhist(I1)
subplot(2,2,4), imhist(CS1)

figure,
subplot(2,2,1), imshow(I2)
subplot(2,2,2), imshow(CS2)
subplot(2,2,3), imhist(I2)
subplot(2,2,4), imhist(CS2)


%% Task 2
clear all,
close all,
clc,

I = imread('firework.jpg');

fun = @(block_struct) (block_struct.data(2,2));
I22 = blockproc(I,[4 4],fun);

fun = @(block_struct) (block_struct.data(1,1));
I11 = blockproc(I,[4 4],fun);

fun = @(block_struct) (uint8(sum(sum(block_struct.data))/16));
Iavg = blockproc(I,[4 4],fun);

figure, 
subplot(2,2,1), imshow(I), title('Original Image')
subplot(2,2,2), imshow(I22), title('downsample by pixel(2,2)')
subplot(2,2,3), imshow(I11), title('downsample by pixel(1,1)')
subplot(2,2,4), imshow(Iavg), title('downsample by avg of block')

% for r = 1:256/4
%     for c = 1:256/4
%         Iavg(r,c) = uint8(sum(sum(I(1+4*(r-1):4+4*(r-1),1+4*(c-1):4+4*(c-1))))/16);
%     end
% end

%% Task 3
% brightness adaptation due to enlargening puppil 

%% Task 4

% if c < 1 : the histogram will be more tight, darker image 
% and if c > 1 : there would be much space between bins, image will be
% lighter
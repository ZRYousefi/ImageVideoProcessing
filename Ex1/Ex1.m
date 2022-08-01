clc,
clear all,
close all,

%% Task 1
I = imread('peppers.png');
figure,
imshow(I)
title('Original Image')

% a
I1 = rgb2gray(I);
figure,
imshow(I1)
title('grey image')

% b
red_I = I(:,:,1);
only_red_I = cat(3, red_I, zeros(size(I,1),size(I,2)), zeros(size(I,1),size(I,2)));
figure,
imshow(only_red_I);
title('Only red component')

% c
I2 = I;
I2(:,:,2) = I2(:,:,2)+50;
figure,
imshow(I2)
title('increasing green component by 50')

% d
R = I(:,:,1);
G = I(:,:,2);
B = I(:,:,3);
I3 = cat(3,B,G,R);
figure,
imshow(I3)
title('reordering RGB to BGR')

figure,
subplot(2,2,1), imshow(I), title('I : Original Image')
subplot(2,2,2), imshow(I1), title('I1 : grey image')
subplot(2,2,3), imshow(I2), title('I2 : increasing green component by 50')
subplot(2,2,4), imshow(I3), title('I3 : reordering RGB to BGR')


%% Task 3
% a
binary_image = [0 0 0 0 0 0 0 1 1 0;
                1 0 0 1 0 0 1 0 0 1;
                1 0 0 1 0 1 1 0 0 0;
                0 0 1 1 1 0 0 0 0 0;
                0 0 1 1 1 0 0 1 1 1];
figure, imshow(binary_image)

% b 
S1 = binary_image(1:4, 2:5);
S2 = binary_image(1:4, 6:9);
nnzero(S1);
nnzero(S2);


% c
load('S.mat')
nnzero(S)


function nnzero(S)
    nnz_S = nnz(S);
    fprintf('number of non-zero values is %d \n', nnz_S);
end

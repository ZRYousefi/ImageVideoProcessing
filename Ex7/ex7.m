clear all
close all
clc

%% Task 1

I = imread('lena.jpg');
ID = im2double(I);
gn = imnoise(I,'gaussian');
Gaussian_noise = im2double(gn);

spn = imnoise(I,'salt & pepper');
Salt_pepper_noise = im2double(spn);

[M,N] = size(I);
a = 0.001;
b = 0.03;
R = a + sqrt(-b*log((1-rand(M,N))));
Rayleigh_noise = ID + R;

figure,
subplot(221), imshow(I),title('Original image')
subplot(222), imshow(Gaussian_noise),title('Gaussian noise')
subplot(223), imshow(Salt_pepper_noise),title('Salt pepper noise')
subplot(224), imshow(Rayleigh_noise),title(' Rayleigh noise')

%% Task 2

Arithmetic_filter_Gaussian = imfilter(Gaussian_noise, fspecial('average', [3 3]));
Geometric_filter_Gaussian = exp(imfilter(log(Gaussian_noise), ones(3, 3), 'replicate')) .^ (1/(3*3)); 
Harmonic_filter_Gaussian = (3*3) ./ (imfilter(1 ./ (Gaussian_noise + eps), ones(3, 3), 'replicate'));

figure
subplot(221), imshow(Gaussian_noise),title('Gaussian noise')
subplot(222), imshow(Arithmetic_filter_Gaussian),title('Arithmetic mean filter')
subplot(223), imshow(Geometric_filter_Gaussian),title('Geometric mean filter')
subplot(224), imshow(Harmonic_filter_Gaussian),title('Harmonic mean filter')

Arithmetic_filter_Salt_pepper = imfilter(Salt_pepper_noise, fspecial('average', [3 3]));
Geometric_filter_Salt_pepper = exp(imfilter(log(Salt_pepper_noise), ones(3, 3), 'replicate')) .^ (1/(3*3)); 
Harmonic_filter_Salt_pepper = (3*3) ./ (imfilter(1 ./ (Salt_pepper_noise + eps), ones(3, 3), 'replicate'));

figure
subplot(221), imshow(Salt_pepper_noise),title('Salt pepper noise')
subplot(222), imshow(Arithmetic_filter_Salt_pepper),title('Arithmetic mean filter')
subplot(223), imshow(Geometric_filter_Salt_pepper),title('Geometric mean filter')
subplot(224), imshow(Harmonic_filter_Salt_pepper),title('Harmonic mean filter')

Arithmetic_filter_Rayleigh_noise = imfilter(Rayleigh_noise, fspecial('average', [3 3]));
Geometric_filter_Rayleigh_noise = exp(imfilter(log(Rayleigh_noise), ones(3, 3), 'replicate')) .^ (1/(3*3)); 
Harmonic_filter_Rayleigh_noise = (3*3) ./ (imfilter(1 ./ (Rayleigh_noise + eps), ones(3, 3), 'replicate'));
figure
subplot(221), imshow(Rayleigh_noise),title('Rayleigh noise')
subplot(222), imshow(Arithmetic_filter_Rayleigh_noise),title('Arithmetic mean filter')
subplot(223), imshow(Geometric_filter_Rayleigh_noise),title('Geometric mean filter')
subplot(224), imshow(Harmonic_filter_Rayleigh_noise),title('Harmonic mean filter')

%% Task 3

clear all
close all
clc

I = imread('baboon.png');
Salt_pepper_noise = imnoise(I,'salt & pepper',0.02);

original_med = medfilt2(Salt_pepper_noise,[5,5]);

Window = [1 1 1 1 1;1 1 1 1 1;1 1 5 1 1;1 1 1 1 1;1 1 1 1 1];
ID = im2double(I);
% IR=ID(:);
[M,N] = size(ID);
filter_size = 5;
padsize = floor(filter_size/2);
pad_img = padarray(ID, [padsize,padsize]);

for i = 1:M
    for j = 1:N
        img_patch = pad_img(i:i+filter_size-1, j:j+filter_size-1);
        Win_I = Window.*img_patch;
        WMF(i,j) = median(Win_I(:));
    end
end

out = uint8(WMF);
% F = uint8(reshape(WMF,[512,512]));

subplot(221), imshow(I),title('Original image')
subplot(222), imshow(Salt_pepper_noise),title('Salt pepper noise')
subplot(223), imshow(original_med),title('original median filtered image')
subplot(224), imshow(WMF),title('Median filtered image by WMF')

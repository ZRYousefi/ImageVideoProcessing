clc
clear all
close all
I=imread('lena.jpg');
ID=im2double(I);
Gaussian_noise0=imnoise(I,'gaussian');
Gaussian_noise = im2double(Gaussian_noise0);

Salt_pepper_noise0=imnoise(I,'salt & pepper');
Salt_pepper_noise=im2double(Salt_pepper_noise0);

[M,N]=size(I);
a=0;
b=.01;
R= a + sqrt(-b*log((1-rand(M,N))));
Rayleigh_noise=ID+R;
subplot(221), imshow(I),title('Original image')
subplot(222), imshow(Gaussian_noise),title('Gaussian noise')
subplot(223), imshow(Salt_pepper_noise),title('Salt pepper noise')
subplot(224), imshow( Rayleigh_noise),title(' Rayleigh noise')

Arithmetic_filter_Gaussian= imfilter(Gaussian_noise, fspecial('average', [3 3]));
Geometric_filter_Gaussian = exp(imfilter(log(Gaussian_noise), ones(3, 3), 'replicate')) .^ (1/(3*3)); 
Harmonic_filter_Gaussian=(3*3) ./ (imfilter(1 ./ (Gaussian_noise + eps), ones(3, 3), 'replicate'));
figure
subplot(221), imshow(Gaussian_noise),title('Gaussian noise')
subplot(222), imshow(Arithmetic_filter_Gaussian),title('Arithmetic mean filter')
subplot(223), imshow(Geometric_filter_Gaussian),title('Geometric mean filter')
subplot(224), imshow(Harmonic_filter_Gaussian),title('Harmonic mean filter')

Arithmetic_filter_Salt_pepper= imfilter(Salt_pepper_noise, fspecial('average', [3 3]));
Geometric_filter_Salt_pepper = exp(imfilter(log(Salt_pepper_noise), ones(3, 3), 'replicate')) .^ (1/(3*3)); 
Harmonic_filter_Salt_pepper=(3*3) ./ (imfilter(1 ./ (Salt_pepper_noise + eps), ones(3, 3), 'replicate'));
figure
subplot(221), imshow(Salt_pepper_noise),title('Salt pepper noise')
subplot(222), imshow(Arithmetic_filter_Salt_pepper),title('Arithmetic mean filter')
subplot(223), imshow(Geometric_filter_Salt_pepper),title('Geometric mean filter')
subplot(224), imshow(Harmonic_filter_Salt_pepper),title('Harmonic mean filter')

Arithmetic_filter_Rayleigh_noise= imfilter(Rayleigh_noise, fspecial('average', [3 3]));
Geometric_filter_Rayleigh_noise = exp(imfilter(log(Rayleigh_noise), ones(3, 3), 'replicate')) .^ (1/(3*3)); 
Harmonic_filter_Rayleigh_noise=(3*3) ./ (imfilter(1 ./ (Rayleigh_noise + eps), ones(3, 3), 'replicate'));
figure
subplot(221), imshow(Salt_pepper_noise),title('Rayleigh noise')
subplot(222), imshow(Arithmetic_filter_Rayleigh_noise),title('Arithmetic mean filter')
subplot(223), imshow(Geometric_filter_Rayleigh_noise),title('Geometric mean filter')
subplot(224), imshow(Harmonic_filter_Rayleigh_noise),title('Harmonic mean filter')

%%
clc
clear all
close all
I=imread('baboon.png');
Salt_pepper_noise=imnoise(I,'salt & pepper',0.02);
Window=[1 1 1 1 1;1 1 1 1 1;1 1 5 1 1;1 1 1 1 1;1 1 1 1 1];
ID=im2double(I);
% IR=ID(:);
[M,N]=size(ID);
for i=1:5:M;
    j=1:5:N;
    MD=median(ID(i,j)*Window)
end
F=uint8(reshape(MD,[512,512]));

subplot(221), imshow(I),title('Original image')
subplot(222), imshow(Salt_pepper_noise),title('Salt pepper noise')
% subplot(223), imshow(),title('original median filtered image')
% subplot(224), imshow(),title('original median filtered image by WMF')

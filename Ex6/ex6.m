clear all
close all
clc

%% Task 1
n = 128;
img_a = 0.5 * ones(n);

img_b = img_a;
img_b((n/2)-10:(n/2)+9, (n/2)-10:(n/2)+9) = ones(20);

r = 0:1/(n-1):1;
img_c = nncopy(r,n,1);

img_d = zeros(128);
img_d((n/2), (n/2)) = 1;

% m = pi:(16*pi)/n:8*pi;
% e = cos(m);
% img_e = nncopy(e,n,1);
% 
% % [u,v] = meshgrid(1:n,1:n);
% [u,v] = meshgrid(1:n);
% img_e = 1/2*(cos(2*pi/n*u+2*pi/n*v)+1);
% % img_e = cos((u+v)/4);
% % % im = (img_e - min(img_e)) / (max(img_e)-min(img_e));
% 
% F = fft2(img_e);
% Fc = fftshift(F);
% figure,
% subplot(1,2,1), imshow(img_e);
% subplot(1,2,2), imshow(log(abs(Fc) + 0.0001));


%% Task 2

F = fft2(img_a);
Fc = fftshift(F);
figure,
subplot(1,2,1), imshow(img_a);
subplot(1,2,2), imshow(log(abs(Fc) + 0.0001));

F = fft2(img_b);
Fc = fftshift(F);
figure,
subplot(1,2,1), imshow(img_b);
subplot(1,2,2), imshow(log(abs(Fc) + 0.0001));

F = fft2(img_c);
Fc = fftshift(F);
figure,
subplot(1,2,1), imshow(img_c);
subplot(1,2,2), imshow(log(abs(Fc) + 0.0001));

F = fft2(img_d);
Fc = fftshift(F);
figure,
subplot(1,2,1), imshow(img_d);
subplot(1,2,2), imshow(log(abs(Fc) + 0.0001));

% F = fft2(img_e);
% Fc = fftshift(F);
% figure,
% subplot(1,2,1), imshow(img_e);
% subplot(1,2,2), imshow(log(abs(Fc) + 0.0001));

% FT of delta is a constant
% FT of a constant is delta in frequency domain
% FT of rectangular is sinc
% FT of a cosine is 2 shifted delta in frequency domain
% FT of ramp is 
%% Task 3

clear all
close all
clc

I = imread('cameraman.tif');
D0 = 2;
n = 2;

LP_fil = BWLPfilter(I, D0, n);
HP_fil = 1-(LP_fil);



F = fft2(I);
Fc = fftshift(F);

G_L = LP_fil.*Fc;
gi_L = ifft2(ifftshift(G_L));
g_L = uint8(real(gi_L));

G_H = HP_fil.*Fc;
gi_H = ifft2(ifftshift(G_H));
g_H = uint8(real(gi_H));

figure,
subplot(1,3,1), imshow(I), title('Original')
subplot(1,3,2), imshow(g_L), title('LP filtered')
subplot(1,3,3), imshow(g_H), title('HP filtered')
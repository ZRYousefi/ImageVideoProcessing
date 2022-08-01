clear all
close all
clc

Img = imread('DIP.jpg');
I = double(Img);
[row, col] = size(I);
[u, v] = meshgrid(-row/2+1:row/2, -col/2+1:col/2);
T = 1;
a = 0.1;
b = 0.1;
H = (T./(pi*(u*a + v*b)+0.001)).*sin(pi*(u*a + v*b)).*exp(-1i*pi*(u*a + v*b)); % Add a small value to the denominator to avoid getting NaN

% Fourier transform
F = fft2(I);
Fc = fftshift(F);

% Blurred image
G = H.*Fc;
gi = ifft2(ifftshift(G));
motion_blurred_img = real(gi);

% Inverse filtering to restore the image
G_inv = (1./(H+0.001)).*G;
restored_img = real(ifft2(ifftshift(G_inv)));

% Mean Square Error
MSE_Blurred = immse(motion_blurred_img, I);
fprintf('\n The mean-squared error for blurred image is %0.4f\n', MSE_Blurred);
MSE_restored = immse(restored_img, I);
fprintf('\n The mean-squared error for restored image is %0.4f\n', MSE_restored);


figure,
subplot(1,3,1), imshow(Img), title('Original');
subplot(1,3,2), imshow(uint8(motion_blurred_img)), title('Motion blurred');
subplot(1,3,3), imshow(uint8(restored_img)), title('Restored');

%% Task 2

noise = 0 + sqrt(50).*randn([row,col]);
degraded_img = motion_blurred_img + noise;


F_noisy = fftshift(fft2(degraded_img));
G_deg_inv = 1./(H+0.001).*F_noisy;
simple_inv_filter = real(ifft2(ifftshift(G_deg_inv)));

Sn = 50;
Sf = abs(Fc);
F_hat = 1./(H+0.001).*(abs(H).^2)./((abs(H).^2 + (Sn./Sf))).*F_noisy;
winere_filter = real(ifft2(ifftshift(F_hat)));


figure
subplot(141);imshow(Img);title('Original')
subplot(142);imshow(uint8(degraded_img));title('Degraded')
subplot(143);imshow(uint8(simple_inv_filter));title('simple inverse filtering')
subplot(144);imshow(uint8(winere_filter));title('Wiener filter')
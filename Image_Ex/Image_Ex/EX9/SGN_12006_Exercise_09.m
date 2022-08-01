clc
clear all
close all
%Problem 1:
I=imread('DIP.jpg');
I_Double=double(I);
[row,col]=size(I_Double);
T=1;a = 0.1;b = 0.1;
[u, v] = meshgrid(-row/2+1:row/2, -col/2+1:col/2);
H=T./(pi*(u*a+v*b)+0.0001).*sin(pi*(u*a+v*b)).*exp(-1i*pi*(u*a+v*b));

%Fourier transform
Fourier_I=fftshift(fft2(I_Double));
Multi1=H.*Fourier_I;
Motion_blurred_image=real(ifft2(ifftshift(Multi1)));


%Apply inverse filtering to restore the image
Inverse1=Multi1./(H+0.001);
Restore_image=real(ifft2(ifftshift(Inverse1)));

%Mean Squared Error values
Mean_Squared_Error1=sum((sum(((Motion_blurred_image)-I_Double).^2))/(row.*col));
Mean_Squared_Error2=sum((sum(((Restore_image)-I_Double).^2))/(row.*col));

%Plot
imshow(log(abs(Fourier_I) + 0.0001),[])
figure
subplot(131);imshow(I);title('Original Image')
subplot(132);imshow(Motion_blurred_image,[]);title(sprintf('Motion blurred, Mean Squared Error = %d',Mean_Squared_Error1))
subplot(133);imshow(Restore_image,[]);title(sprintf('Restore image, Mean Squared Error = %d',Mean_Squared_Error2))
%%
%Problem 2:
noise = 0 + sqrt(50).*randn([row,col]);
Degraded=Motion_blurred_image+noise;
Noise=fftshift(fft2(noise));
Fourier_Motion_blurred=fftshift(fft2(Motion_blurred_image));
G=Fourier_Motion_blurred+Noise;

%b. Apply simple inverse filtering
Multi2=H.*G;
Inverse2=Multi2./(H+0.001);
inverse_filtering=real(ifft2(ifftshift(Inverse2)));

%c. Apply the Wiener filter: 
ABS=abs(H);
Sn=(sum(sum(abs(noise)).^2 ));
Sf=(sum(sum(abs(I_Double)).^2));
Wiener_filter=1./(H+0.001).*((ABS.^2)./(ABS.^2+(Sn/Sf))).*G;
Inverse_Fourier=real(ifft2(ifftshift(Wiener_filter)));%whyyy :(

%Plot
figure
subplot(141);imshow(I,[]);title('Original')
subplot(142);imshow(Degraded,[]);title('Degraded')
subplot(143);imshow(inverse_filtering,[]);title('simple inverse filtering')
subplot(144);imshow(Inverse_Fourier,[]);title('Wiener filter')


%Question Number 1
clc
close all
clear all
%A)
A=0.5*ones(128);

F = fft2(A);
Fc = fftshift(F);
figure
subplot(2,1,1)
imshow(A)
subplot(2,1,2)
imshow(log(abs(Fc) + 0.0001));



% %B)

clear all
B=0.5*ones(128);
B(54:73, 54:73) = ones(20);

F = fft2(B);
Fc = fftshift(F);
figure
subplot(2,1,1)
imshow(B)
subplot(2,1,2)
imshow(log(abs(Fc) + 0.0001));


% imshow(I,[])
%C)
clear all
C=0:1/127:1;
CC=nncopy(C,128,1);
F = fft2(CC);
Fc = fftshift(F);
figure
subplot(2,1,1)
imshow(CC)
subplot(2,1,2)
imshow(log(abs(Fc) + 0.0001));



%D)
clear all
D=zeros(128);
D(54:73, 54:73) = ones(20);
F = fft2(D);
Fc = fftshift(F);
figure
subplot(2,1,1)
imshow(D)
subplot(2,1,2)
imshow(log(abs(Fc) + 0.0001));


%E)
clear all
n=-8*pi:(16*pi)/128:8*pi;
L=cos(n);
CS=nncopy(L,128,1);
F = fft2(CS);
Fc = fftshift(F);
figure
subplot(2,1,1)
imshow(CS)
subplot(2,1,2)
V=log(abs(Fc) + 0.0001);
imshow(V);

%

%%
%Question Number 2
clc
close all
clear all
I=imread('cameraman.tif');
n=2;
cutoff=20;
[rows,cols] = size(I);
[u,v] = meshgrid(1:1:cols,1:1:rows);
D = sqrt( (u-cols/2).^2 + (v-rows/2).^2 );
Low = 1./(1+((D./cutoff).^(2*n)));
High=1-(Low);

F = fft2(I);
Fc = fftshift(F);
G = High.*Fc;
gi = ifft2(ifftshift(G));
g = real(gi);
imshow(I)
figure
imshow(g, []);

%%
%Question Number 3
clc
close all
clear all
N=8;
N=16;

dct = D*I*D';
figure, imshow(dct)

clc
clear all
close all
I=imread('cameraman.tif');
Y=double(I)
%a)
[M,N]=size(I);
F = fft2(Y);
Fc = fftshift(F);
figure(1)
imshow(I)
figure(2)
L=log(abs(Fc) + 0.0001);
imshow(L,[])
%
J = dct2(Y);
figure(3)
JJ=log(abs(J))
imshow(JJ,[])
IY=idct2(J);
%
H=haarmtx(M);
TH=H.*Y.*H';
figure(4)
imshow(TH)
%
W = walsh_hadamard(M);
TW=W.*Y.*W;
figure(5)
imshow(TW)
%%
%b)

[M N]= size(L);
Z=L;
M1=N/4;
N1=3*N/4;
L=zeros(N);
L(M1:N1,M1:N1)=Z(M1:N1,M1:N1);
figure
subplot(2,2,1),imshow(L);

[M N]= size(JJ);
A=JJ(1:M/2,1:N/2)*1;
B=JJ(1:M/2,N/2+1:N)*0;
C=JJ(M/2+1:M,1:N/2)*0;
D=JJ(M/2+1:M,N/2+1:N)*0;
Q2=([A B;C D]);
subplot(2,2,2),imshow(Q2);

[M N]= size(TW);
A=TW(1:M/2,1:N/2)*1;
B=TW(1:M/2,N/2+1:N)*0;
C=TW(M/2+1:M,1:N/2)*0;
D=TW(M/2+1:M,N/2+1:N)*0;
Q3=([A B;C D]);
subplot(2,2,3),imshow(Q3);


[M N]= size(TW);
A=TW(1:M/2,1:N/2)*1;
B=TW(1:M/2,N/2+1:N)*0;
C=TW(M/2+1:M,1:N/2)*0;
D=TW(M/2+1:M,N/2+1:N)*0;
Q4=([A B;C D]);
subplot(2,2,4),imshow(Q4);



I1=real(ifft2(ifftshift(Fc)));
I2=(idct2(J)); 
I3=H'*TH*H;
I4=W*TW*W;
figure
subplot(2,2,1);imshow(uint8(I1));
subplot(2,2,2);imshow(uint8(I2));
subplot(2,2,3);imshow(uint8(I3));
subplot(2,2,4);imshow(uint8(I4));

%%
%c)

er1=sum(sum((uint8(I1)-I).^2))/(N.*N)
er2=sum(sum((uint8(I2)-I).^2))/(N.*N)
er3=sum(sum((uint8(I3)-I).^2))/(N.*N)
er4=sum(sum((uint8(I4)-I).^2))/(N.*N)
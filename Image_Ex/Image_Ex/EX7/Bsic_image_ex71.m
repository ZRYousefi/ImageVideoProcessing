% %% Basic Image
% % what is a transform?
% % An image transform can be applied to an image to convert it from one domain to another
% % to help identification of features that may not be as easily detected in the spatial domain.
% %% Task 1: Haar Transformation
% 
% % T= HIH';
% % N=size(I);
% % n= log(N)/log(2);
% % k=(2^p)+q-1
% 
% % k=0 .....> h(x)= 1./sqrt(N)
% % otherwise....> h(x)=1./sqrt(N)*S;
% % 
% % S=2^(p/2).......................... if (q-1)/(2^p)<=x<(q-0.5)/(2^p)
% % S=-(2^(p/2))................. else if  (q-0.5)/(2^p)<=x<q/(2^p)
% % S=0 .............otherwise
% 
% % H(i,j)=hi(j/N)
% N=4;
% k=0:N-1;
% p=zeros(1,N);
% q=zeros(1,N);
% p(2:N)=floor(log2(k(2:N)));
% 
% for i=1:N
% q(i)=k(i)-2^p(i) +1;
% end
% 
% x=0:1/N:(N-1)/N;
% H=zeros(N);
% h=0;
% S=0;
% %%% K starts from 0 but i starts from 1 ??????
% for i=1:N
%     for j=1:N
%         x=j/N;
%         if ((q(i)-1)/(2^p(i)))<=x && x<((q(i)-0.5)/(2^p(i)))
%          S=2^(p(i)/2);
%         end
%         if (q(i)-0.5)/(2^p(i))<=x && x<q(i)/(2^p(i))
%         S=-(2^(p(i)/2));
%         end
%         H(i,j)=(1./sqrt(N))*S;
%     end
% end
%%
%The Hadamard transform can be regarded as being built out of size-2 discrete Fourier transforms (DFTs), 
% and is in fact equivalent to a multidimensional DFT


%% Task 3
close all;
clear all;
clc;
I = double(imread('cameraman.tif'));
N=size(I);
N=N(1);

H=haarmtx(N);
W= walsh_hadamard(N);


T_Haar = H * I* H';

T_walsh = W * I * W;

T_DFT= fftshift(fft2(I));

T_DCT =dct2(I);

% showing results

imshow(uint8(I));title('original image');

figure;
subplot(221);imshow(T_Haar,[0 10]);title('Haar Transform')
subplot(222);imshow((T_walsh),[0 20]);title('Walsh Transform')
subplot(223);imshow(log(abs(T_DFT)+0.0001),[]);title('DFT Transform')
subplot(224);imshow(log(abs(T_DCT)),[]);title('DCT Transform')

%%
L=N/2;
f=N/4;
s=3*(N/4);

T_Haar(:,L:end)=0;
T_Haar(L:end,:)=0;

T_walsh(:,L:end)=0;
T_walsh(L:end,:)=0;

temp=T_DFT;

T_DFT=zeros(N);
T_DFT(f:s,f:s)=temp(f:s,f:s);


T_DCT(:,L:end)=0;
T_DCT(L:end,:)=0;


figure;
subplot(221);imshow(log(abs(T_Haar)));
subplot(222);imshow(log(T_walsh));
subplot(223);imshow(log(abs(T_DFT)+0.0001), []);
subplot(224);imshow(log(abs(T_DCT)),[]);

%%
image_Haar=H'*T_Haar*H;
image_Walsh=W*T_walsh*W;
image_DFT=real(ifft2(ifftshift(T_DFT)));
image_DCT=(idct2(T_DCT)); 


figure;
subplot(221);imshow(image_Haar,[0 256]);
subplot(222);imshow(image_Walsh,[0 256]);
subplot(223);imshow(image_DFT,[0 256]);
subplot(224);imshow(image_DCT,[0 256])
%%
%(y - yhat)    % Errors
%(y - yhat).^2   % Squared Error
%mean((y - yhat).^2)   % Mean Squared Error


MSE_Haar=sum(sum((image_Haar-I).^2))/(N.*N)
MSE_walsh=sum(sum((image_Walsh-I).^2))/(N.*N)
MSE_DFT=sum(sum((image_DFT-I).^2))/(N.*N)
MSE_DCT=sum(sum((image_DCT-I).^2))/(N.*N)


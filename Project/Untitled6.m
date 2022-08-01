



I1 = imread('talisman.jpg');
S1 = imsharpen(I1, 'Radius',2,'Amount',1);
figure
imshowpair(I1,S1,'montage')
title('Original (left) and Sharpened (right) Image')



I2 = imread('17drawin.jpg');
kernel = -1 * ones(3)/9
kernel(2,2) = 8;
kernel = kernel / sum(kernel(:)); % Normalize sum to 1.
% High frequency boost filter
sharpenedImage = conv2(double(I2), kernel, 'same');
imshow(sharpenedImage);



clear all
close all
clc
f=imread('02serov.jpg');
f=double(f);
figure,imshow(f,[])
 
M=size(f,1); N=size(f,2); % nr of rows/columns of image f
C=3; D=3; % nr of rows/columns of kernel h
P=M+C-1; Q=N+D-1; % nr of rows/columns after padding
fp=zeros(P,Q); % zero padding: start with zeroes
fp(1:M,1:N)=f; % insert f into image fp
hp=zeros(P,Q); % Construct filter matrix hp, same size as fp.
hp(1,1)=-4; hp(2,1)=1; hp(1,2)=1; % Center is at (1,1)
hp(P,1)=1; hp(1,Q)=1; % Indices modulo P or Q
 
Fp=fft2(double(fp), P, Q); % FFT of image fp
Hp=fft2(double(hp), P, Q); % FFT of kernel hp
H = fftshift(Hp);%swaps the left and right halves of Hp
F1 = abs(H); % Get the magnitude
F1 = log(F1+1); % Use log, for perceptual scaling, and +1 since log(0) is undefined
F1 = mat2gray(F1,[0 1]);%converts the matrix F1 to the intensity image F1
figure,imshow(F1);
 
Gp=Fp .* Hp; % Product of FFTs
gp=ifft2(Gp); % Inverse FFT
gp=real(gp); % Take real part
g=gp(1:M, 1:N);
figure,imshow(g,[])
 
gnorm = g;
gshar = double(f) - gnorm;
figure,imshow(uint8(gshar))


% A=imread('02serov.jpg');
% I=zeros(size(A));
% I2=zeros(size(A));

%Filter Masks
F1=[0 1 0;1 -4 1; 0 1 0];
F2=[1 1 1;1 -8 1; 1 1 1];
%Input Image
A=imread('02serov.jpg');
figure,imshow(A);

%Padarray with zeros
A=padarray(A,[1,1]);
A=double(A);

%Implementation of the equation in Fig.D
for i=1:size(A,1)-2
    for j=1:size(A,2)-2
       
        I(i,j)=sum(sum(F1.*A(i:i+2,j:j+2)));
       
    end
end

I=uint8(I);
figure,imshow(I);title('Filtered Image');

%Sharpenend Image
%Refer Equation in Fig.F
B=I1-I;
figure,imshow(B);title('Sharpened Image');



I= imread('02serov.jpg'); % read image
H = padarray(2,[2 2]) - fspecial('gaussian' ,[5 5],2); % create unsharp mask % create unsharp mask
figure,imshow(I);
K = imfilter(I,H);  % create a sharpened version of the image using that mask
figure,imshow(K); %showing input & output images

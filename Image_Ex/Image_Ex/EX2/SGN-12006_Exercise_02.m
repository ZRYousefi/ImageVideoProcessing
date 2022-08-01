close all
clear all
I=imread('peppers.png');
imshow(I)
[I1,map] = rgb2ind(I,32);
figure
imshow(I1)
R = I(:,:,1);
G = I(:,:,2);
B = I(:,:,3);
I2=cat(256,R,G,B);
I3=rgb2gray(I)

%Question 2
A='D:\c_1.jpg';
I=imread(A,'jpg')
% Question number 3
s1=[0 0 0 0;0 0 1 0;0 0 1 0;0 1 1 1];
s2=[0 0 1 1;0 1 0 0;1 1 0 0;0 0 0 0];
S = cat(2,s1,s2);
imshow(S)
%%

%Set2

% Q1:
% A=[0:255];
% step = 256/4;
% QA1 = quant(A, step);
% partition = step:step:256-step;
% codebook = step/2:step:256-step/2;
% [indx,QA2] = quantiz(A, partition, codebook);
% C1 = unique(QA1)
% C2 = unique(QA2)

% Q2
I=imread('lena_face.png');
imshow(I)
%____________________16________________________%
% A=I(:);
% step = 256/16;
% QA1 = quant(A, step);
% partition = step:step:256-step;
% codebook = step/2:step:256-step/2;
% [indx,QA2] = quantiz(A, partition, codebook);
% R=uint8(reshape(QA2,[256,256]));
% imshow(R)
%____________________32________________________%
A=I(:);
n=8*randn(256);
n2 = uint8(n);
N=n2+I;
A=N(:);
step = 256/16;
QA1 = quant(A, step);
partition = step:step:256-step;
codebook = step/2:step:256-step/2;
[indx,QA3] = quantiz(A, partition, codebook);
R1=uint8(reshape(QA3,[256,256]));
imshow(R1)
subplot(1,2,1), subimage(I)
subplot(1,2,2), subimage(R1)


% 
% I2=n2+I;
% subplot(1,2,1), subimage(I)
% subplot(1,2,2), subimage(I2)

% %Q3.1:
I=63*ones(8);
I(3:6, 3:6) =127*ones(4);
I1 = uint8(I);
I2=223*ones(8);
I2(3:6, 3:6) = 127*ones(4);
I3 = uint8(I2);
newImg1 = cat(2,I1,I3);
%Q3.2
N=63*ones(8);
N(3:6, 3:6) =127*ones(4);
N1 = uint8(N);
N2=223*ones(8);
N2(3:6, 3:6) =150*ones(4);
N3 = uint8(N2);
newImg2 = cat(2,N1,N3);
subplot(1,2,1), subimage(newImg1)
subplot(1,2,2), subimage(newImg2)

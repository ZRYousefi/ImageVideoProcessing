function [M,N,M2,N2] = direct_filter(n)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
I=imread('cameraman.tif');
if n==3
    M=[0 0 0;1 1 1;0 0 0]/3;
    N=eye(3)/3;
    M2 = rot90(M);
    N2 = rot90(N);
%     P=M+M2+N+N2;
end
if n==5
    M=[0 0 0 0 0 ;0 0 0 0 0 ; 1 1 1 1 1;0 0 0 0 0;0 0 0 0 0]/5;
    N=eye(5)/5;
    M2 = rot90(M);
    N2 = rot90(N);
end
if n==7
    M=[ 0 0 0 0 0 0 0;
        0 0 0 0 0 0 0;
        0 0 0 0 0 0 0;
        1 1 1 1 1 1 1;
        0 0 0 0 0 0 0;
        0 0 0 0 0 0 0;
        0 0 0 0 0 0 0 ]/7;

    N=eye(7)/7;

    M2 = rot90(M);
    N2 = rot90(N);
end

W=conv2(double(I),M,'valid');
W2=uint8(M);
out1=imfilter(I,M,'same');

X=conv2(double(I),N,'valid');
X2=uint8(N);
out2=imfilter(I,N,'same');

Y=conv2(double(I),M2,'valid');
Y2=uint8(M2);
out3=imfilter(I,M2,'same');

Z=conv2(double(I),N2,'valid');
Z2=uint8(N2);
out4=imfilter(I,N2,'same');
figure
subplot(2,2,1)
imshow(out1)
subplot(2,2,2)
imshow(out2)
subplot(2,2,3)
imshow(out3)
subplot(2,2,4)
imshow(out4)
end


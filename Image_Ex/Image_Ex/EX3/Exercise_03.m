close all
clear all
% load ''
A = imread('wom1.png');
imshow(A)
M=A(:);

myhist=zeros(1,256);  % prealocate
x=0:1:10;

for n=1:length(M)
    myhist(1,M(n)+1)=myhist(1,M(n)+1)+1; % every time you meet the particular value, you add 1 into to corresponding bin
end
figure
bar(myhist)
J = imadjust(A,stretchlim(A),[]);
figure
imhist(J)
imshow(J)

M = imread('mbaboon.bmp');
imshow(M)
Xdown = M(1:4:end,1:4:end);
figure
imshow(Xdown)
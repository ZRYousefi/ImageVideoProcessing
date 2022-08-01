close all
clear all
m=imread('moon.png');
h=imread('house.png');
s=imread('spine.jpg');
c=imread('church.png');
%
out=10;
subplot(1,2,1)
out=histequal(m,out);

subplot(1,2,2)
imhist(m);

% 
% figure(2)
% subplot(1,2,1)
% out=histequal(h,out)
% subplot(1,2,2)
% imhist(h);
% 
% figure(3)
% subplot(1,2,1)
% out=histequal(s,out)
% subplot(1,2,2)
% imhist(s);
% 
% figure(4)
% subplot(1,2,1)
% out=histequal(c,out)
% subplot(1,2,2)
% imhist(c);

% II =ContrastStretch(m, 1, 100)


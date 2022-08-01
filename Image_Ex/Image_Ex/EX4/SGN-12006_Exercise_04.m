%    Question 1:
clc
close all
clear all
%a)
r=imread('university.png');
subplot(1,2,1)
imshow(r)
% s = c*log(1 + double(r))
r2=im2double(r);
s=5*log(1+r2);
subplot(1,2,2)
imshow(s)

%b)
% s = c*r^g
figure(2)
subplot(1,2,1)
imshow(r)
s2=1.6*(r2).^.45;
subplot(1,2,2)
imshow(s2)
%%
%    Question 2:

%%
%    Question 3:
A=imread('corel.png');
B=imread('church.png');
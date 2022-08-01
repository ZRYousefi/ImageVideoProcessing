close all
clear all

% W = imread('wom1.PNG');
% imshow(W)
% WO=W(:);
% 
% myhist=zeros(1,256);
% x=0:1:10;
% 
% for n=1:length(WO)
%     myhist(1,WO(n)+1)=myhist(1,WO(n)+1)+1; % every time you meet the particular value, you add 1 into to corresponding bin
% end
% 
% figure
% bar(myhist)

%b)

% PO=(PI-c)(b-a)(d-c)+a
%c)

% I = imread('man8.PNG');
% c=input('Enter the constant value, c = ');
% [M,N]=size(I);
%         for x = 1:M
%             for y = 1:N
%                 m=double(I(x,y));
%                 z(x,y)=c.*log10(1+m);
%             end
%         end
% subplot(2,2,1)
% imshow(I)
% 
% subplot(2,2,2)
% imshow(z)
% 
% subplot(2,2,3)
% imhist(I)

% subplot(2,2,4)
% imhist(z)


% J = imadjust(A,stretchlim(A),[]);
% figure
% imhist(J)
% imshow(J)
%%
% a)
M = imread('mbaboon.bmp');
subplot(4,2,1)
imshow(M)
Xdown = M(2:4:end,2:4:end);
subplot(4,2,2)
imshow(Xdown)

%b)
Xdown2 = M(1:4:end,1:4:end);
subplot(4,2,3)
imshow(Xdown2)

%c)

[M,N]=size(M);
for x=1:M
        y=1:N
        sum=0;
        sum=x+y;
    
           ave=((x+y)/16)
end


imagesc(log(abs(fftshift(fft2(M)))+0.0001))

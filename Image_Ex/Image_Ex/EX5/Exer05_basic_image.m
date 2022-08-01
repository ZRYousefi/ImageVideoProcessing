clc
close all
clear all
I=imread('cameraman.tif');
X=[-1 -1 -1;-1 8 -1;-1 -1 -1]
Y=[-1 -1 -1;-1 9 -1;-1 -1 -1]
Z=[-1 -1 -1;-1 9.7 -1;-1 -1 -1] 

M=conv2(double(I),X,'valid');
M2=uint8(M);  
out1=imfilter(I,X,'same');

N=conv2(double(I),Y,'valid');
N2=uint8(M);  
out2=imfilter(I,Y,'same');

P=conv2(double(I),Z,'valid');
P2=uint8(M);  
out3=imfilter(I,Z,'same');

subplot(2,2,1)
imshow(I)
subplot(2,2,2)
imshow(out1)
subplot(2,2,3)
imshow(out2)
subplot(2,2,4)
imshow(out3)

%%
clc
close all
clear all
I=imread('cameraman.tif');
N= rand( size(I) )*20;

N2=cast(N,'uint8');
I2=cast(I,'uint8');
I3 =I2+N2;
subplot(1,2,1)
imshow(I)
subplot(1,2,2)
imshow(I3)

%%
clc
close all
clear all
old=imread('Miranda1.tif');
J=wgn(100,100,30);
I=cast(old,'double'); %Or this command....I=  im2double(old)
I(150:249,150:249)=J+I(150:249,150:249);
subplot(1,2,1)
subimage(old)

subplot(1,2,2)
T=cast(I,'uint8');
subimage(T)

%b)
n=5;
thresh=10;
new=medfilt_th(I,n,thresh);

%c)

[io,jo] = size(old);
for m=1:io;
    for n=1:jo;
        h=median
        new(i+2,j+2)=old(m:m+4,n:n+4); %put in the middle
    end
    
end
%just for examination we use medfilt2
new = medfilt2(old,[n n]);
old = double(old);
new = double(new);
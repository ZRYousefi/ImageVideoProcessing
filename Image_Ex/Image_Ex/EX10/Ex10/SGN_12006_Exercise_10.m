clc
clear all
close all
Fruits=imread('fruits.jpg');
Festia=imread('festia.jpg');
R=Fruits(:,:,1);
G=Fruits(:,:,2);
B=Fruits(:,:,3);
R1 = histeq(R);
G1 = histeq(G);
B1 = histeq(B);
histogram_equalization = cat(3,R1,G1,B1);
subplot(121);imshow(Fruits);title('Original image')
subplot(122);imshow(histogram_equalization);title('Equalized image')
%%
clc
clear all
close all
I=imread('fruits.jpg');
I=imread('festia.jpg');

RGB_Eq=intensityeq( I );


%%
clc
clear all
close all
Lake=rgb2hsv(imread('lake.jpg'));

R=Lake(:,:,1);
G=Lake(:,:,2);
B=Lake(:,:,3);

graythresh_R = graythresh(R);
graythresh_G = graythresh(G);
graythresh_B = (graythresh(B));

BW_B = im2bw(Lake,graythresh_B); %only work with one of the thresh

Lb_B=bwlabel(BW_B);

f = hist(Lb_B(:), [min(Lb_B(:)): max(Lb_B(:))]);
f(1)=0;
[val ind]=max(f);

croppedR=R.*(double((Lb_B==(ind-1))));
croppedG=G.*(double((Lb_B==(ind-1))));
croppedB=B.*(double((Lb_B==(ind-1))));

cropped=hsv2rgb(cat(3,croppedR,croppedG,croppedB));
imshow(cropped)



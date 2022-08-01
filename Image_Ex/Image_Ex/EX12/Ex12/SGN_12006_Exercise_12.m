clc
clear all
close all
load yuvdata.mat
size=cols*rows;
Y=reshape(yy,[cols rows]);
uu_reshape=reshape(uu,[cols/2 rows/2]);
vv_reshape=reshape(vv,[cols/2 rows/2]);

U=imresize(uu_reshape,[cols rows]);
V=imresize(vv_reshape,[cols rows]);

subplot(131);imshow(uint8(Y)');title('yy reshape')
subplot(132);imshow(uint8(U)');title('uu reshape')
subplot(133);imshow(uint8(V)');title('vv reshape')

U = U-127;
V=V-127;

YUV = cat(2,Y(:),U(:),V(:));
yuvToRgb=[1     0         1.402;
          1    -0.34413   -0.71414;
          1     1.772    0       ];
RGB = yuvToRgb * YUV';
R=reshape(RGB(1,:),[cols rows]);
G=reshape(RGB(2,:),[cols rows]);
B=reshape(RGB(3,:),[cols rows]);

i=cat(3,R',G',B');
figure
I=uint8(i);
imshow(I)
%%

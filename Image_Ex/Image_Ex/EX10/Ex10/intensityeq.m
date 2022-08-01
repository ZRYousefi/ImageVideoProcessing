function RGB_Eq=intensityeq( I )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
% ID=double(I);
HSV_I=rgb2hsv(I);
H=HSV_I(:,:,1);
S=HSV_I(:,:,2);
V=HSV_I(:,:,3);
% H1 = histeq(H);
% S1 = histeq(S);
V1 = histeq(V);
HSV_Eq = cat(3,H,S,V1);

RGB_Eq=hsv2rgb(HSV_Eq);
subplot(121);imshow(I);title('Original image')
subplot(122);imshow(RGB_Eq);title('Equalized image')
end


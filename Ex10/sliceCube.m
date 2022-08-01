function outImage = sliceCube(Image, chosen_pixel, dist)

I = double(Image);
m = size(I,1);
n = size(I,2);


I_R = I(:,:,1);
I_G = I(:,:,2);
I_B = I(:,:,3);

C_R = chosen_pixel(1);
C_G = chosen_pixel(2);
C_B = chosen_pixel(3);

Out_double = zeros(m,n);
Out_double((abs(I_R - C_R) + abs(I_G - C_G) + abs(I_B - C_B)) <= dist) = 1;
S_R = I_R;
S_G = I_G;
S_B = I_B;

S_R(find(Out_double==0)) = 0;
S_G(find(Out_double==0)) = 0;
S_B(find(Out_double==0)) = 0;

outImage = uint8(cat(3,S_R, S_G, S_B));


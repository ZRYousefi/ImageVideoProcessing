%Program for white balancing% 
%Author : Jeny Rajan 
function Output=wbalance(image) 
Original = image; 
YCbCr=rgb2ycbcr(image); 
Lu = YCbCr(:,:,1); 
Cb = YCbCr(:,:,2); 
Cr = YCbCr(:,:,3); 

[x y z] = size(image); 
tst = zeros(x,y); 
Mb = sum(sum(Cb)); 
Mr = sum(sum(Cr)); 
Mb = Mb/(x*y); 
Mr = Mr/(x*y); 
Db = sum(sum(Cb-Mb))/(x*y); 
Dr = sum(sum(Cr-Mr))/(x*y); 
cnt = 1; 
Ciny = zeros(1,x*y); % 
for i = 1:x 
    for j = 1:y 
        b1 = Cb(i,j)-(Mb+Db*sign(Mb)); 
        b2 = Cr(i,j)-(1.5*Mr+Dr*sign(Mr)); 
        if (b1<(1.5*Db) & b2<(1.5*Dr)) 
            Ciny(cnt) = Lu(i,j); 
            tst(i,j) = Lu(i,j); 
            cnt = cnt+1; 
        end 
    end 
end 
Ciny(cnt:end) = []; % 
cnt = cnt-1; 
iy = sort(Ciny,'descend'); 
nn = round(cnt/10); 
Ciny2(1:nn) = iy(1:nn); 
mn = min(Ciny2); 
c = 0;  
for i = 1:x 
    for j=1:y 
        if tst(i,j)<mn 
            tst(i,j)=0; 
        else 
            tst(i,j)=1; 
            c=c+1; 
        end 
    end 
end 
R = image(:,:,1); 
G = image(:,:,2); 
B = image(:,:,3); 
R = double(R).*tst; 
G = double(G).*tst; 
B = double(B).*tst; 
Rav = mean(mean(R)); 
Gav = mean(mean(G)); 
Bav = mean(mean(B)); 
Ymax = double(max(max(Lu)))/15; 
Rgain = Ymax/Rav; 
Ggain = Ymax/Gav; 
Bgain = Ymax/Bav; 
image(:,:,1) = image(:,:,1)*Rgain; 
image(:,:,2) = image(:,:,2)*Ggain; 
image(:,:,3) = image(:,:,3)*Bgain; 
Output = image; 

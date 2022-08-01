function ineq_image = intensityeq(rgb_image)

hsv_image = rgb2hsv(rgb_image);
h = hsv_image(:,:,1);
s = hsv_image(:,:,2);
v = hsv_image(:,:,3);
% heq = histeq(h);
% seq = histeq(s);
veq = histeq(v);
Ieq = cat(3,h,s,veq);
ineq_image = hsv2rgb(Ieq);
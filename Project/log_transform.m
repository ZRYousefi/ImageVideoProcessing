function log_image = log_transform(image, c)

R = image(:,:,1);
G = image(:,:,2);
B = image(:,:,3);

hsv_image = rgb2hsv(image);
h = hsv_image(:,:,1);
s = hsv_image(:,:,2);
v = hsv_image(:,:,3);

log_R = c*exp(1+R);
log_G = c*exp(1+G);
log_B = c*exp(1+B);
log_image = cat(3,log_R,log_G,log_B);


function histeq_img = histogrameq(img)

r = img(:,:,1);
g = img(:,:,2);
b = img(:,:,3);
req = histeq(r);
geq = histeq(g);
beq = histeq(b);
histeq_img = cat(3,req,geq,beq);